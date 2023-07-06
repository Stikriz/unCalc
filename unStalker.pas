unit unStalker;

interface

 uses Sysutils, unVariables, unStack, unCompiler, unExternals,
      unCalckConstants, unFunctionsClk, UnUDBFunctions, Forms;

 Type                              

  TunStalker = class(TObject)
   private
    FVariables: TunVariables;
    FStack: TunStack;
    FSubStack: TunStack;
    FCompiler: TunCompiler;
    FFunctions: TunFunctions;
    FExternals: TunExternals;
    CurrTok: TEnumToken;
    LastValue: Variant;
    LastString: string;
    LastName: string;
    isLastString: boolean;
    FLabelOnError: string;
    FOldErrorMessage: string;
   protected
    function Expr: Variant;
    function Term: Variant;
    function CreateFunction(const Index: Integer): Variant;
    function Bool: Variant;
    function Prim: Variant;
    function DoGetExternalValue(const Index: Integer): Variant;
   public
    constructor Create;
    destructor Destroy; override;
    procedure Run;
    function GetTuken: TEnumToken;
    function isReservedWords(const AName: string): boolean;
    property Variables: TunVariables read FVariables write FVariables;
    property Stack: TunStack read FStack write FStack;
    property SubStack: TunStack read FSubStack write FSubStack;
    property Compiler: TunCompiler read FCompiler write FCompiler;
    property Functions: TunFunctions read FFunctions write FFunctions;
    property Externals: TunExternals read  FExternals write FExternals;
    property LabelOnError: string read FLabelOnError write FLabelOnError;
    property OldErrorMessage: string read FOldErrorMessage;
  end;

implementation

{ TunStalker }

constructor TunStalker.Create;
begin
 FLabelOnError:='';
end;

destructor TunStalker.Destroy;
begin
  inherited;

end;

procedure TunStalker.Run;
var IsError: boolean;
label OnError;
begin
 IsError:=false;
 FLabelOnError:='';
OnError:
 try
   if not IsError then
    GetTuken;
   IsError:=false;
   while CurrTok <> calck_End do
    Bool;
 except on E: Exception do
  begin
   E.Message:=CheckErrorMessage(E.Message);
   if Trim(FLabelOnError) <> '' then
    begin
     IsError:=true;
     FOldErrorMessage:=E.Message+CLR+STR_1+IntToStr(FCompiler.ProgrammString)+CLR+
     STR_2+IntToStr(FCompiler.ProgrammChar)+CLR+FCompiler.Programm[FCompiler.ProgrammString - 1];
    end
   else
    raise;
  end;
 end;
 if IsError then
  begin
   FStack.Clear;
   FStack.Push(FLabelOnError);
   Self.FFunctions.Execute('_3');
   FLabelOnError:='';
   goto OnError;
  end;
end;

function TunStalker.isReservedWords(const AName: string): boolean;
begin
 Result:=false;
 case AName[1] of
  ';', ':', '!', '^', '_', '+', '-', '*', '/', ',',
  '=', '0' .. '9', '"', '(', ')', '<', '>': begin
        Result:=true;
       end;
  else begin
        if AName = 'NOT' then
         begin
          Result:=true;
          exit;
         end;
        if AName = 'OR' then
         begin
          Result:=true;
          exit;
         end;
        if AName = 'AND' then
         begin
          Result:=true;
          exit;
         end;
        if AName = VAL_END then
         begin
          Result:=true;
          exit;
         end;
       end;
 end;
end;

function  TunStalker.GetTuken: TEnumToken;
var TempStr: string;
    TempValue: string;
    I: Integer;
label NextTerm;
begin
 Application.ProcessMessages;
     NextTerm:
 TempStr:=FCompiler.GetNext;
 case TempStr[1] of
  ';', ':': begin   // Перевод строки или метка
        goto NextTerm;
       end;
  '!': begin  // Внешнее имя
        CurrTok:=calck_ExternalName;
        //TempStr[1]:=' ';
        LastName:=Trim(TempStr);
        Result:=calck_ExternalName;
       end;
  '^': begin   // Переменная
        CurrTok:=calck_Name;
        LastName:=TempStr;
        Result:=calck_Name;
       end;
  '_': begin // Функция
        CurrTok:=calck_Function;
        LastName:=TempStr;
        Result:=calck_Function;
       end;
  '+': begin
        CurrTok:=calck_Plus;
        Result:=calck_Plus;
       end;
  '-': begin
        CurrTok:=calck_Minus;
        Result:=calck_Minus;
       end;
  '*': begin
        CurrTok:=calck_Mul;
        Result:=calck_Mul;
       end;
  '/': begin
        CurrTok:=calck_Div;
        Result:=calck_Div;
       end;
  ',': begin
        CurrTok:=calck_Push;
        Result:=calck_Push;
       end;
  '=': begin
        if TempStr = '==' then
         begin
          CurrTok:=calck_Equality;
          Result:=calck_Equality;
         end
        else
         begin
          CurrTok:=calck_Assign;
          Result:=calck_Assign;
         end;
       end;
  '0' .. '9': begin
        CurrTok:=calck_Value;
        isLastString:=false;
        LastValue:=StrToFloat(TempStr);
        Result:=calck_Value;
       end;
  '"': begin
        CurrTok:=calck_Value;
        isLastString:=true;
        TempValue:='';
        for I:=2 to Length(TempStr)-1 do
         begin
          TempValue:=TempValue+TempStr[I];
         end;
        LastValue:=TempValue;
        LastString:=TempValue;
        Result:=calck_Value;
       end;
  '(': begin
        CurrTok:=calck_LP;
        Result:=calck_LP;
       end;
  ')': begin
        CurrTok:=calck_RP;
        Result:=calck_RP;
       end;
  '[': begin
        CurrTok:=calck_LM;
        Result:=calck_LM;
       end;
  ']': begin
        CurrTok:=calck_RM;
        Result:=calck_RM;
       end;
  '<': begin
        if TempStr = '<>' then
         begin
          CurrTok:=calck_NotEquality;
          Result:=calck_NotEquality;
         end
        else
         begin
          CurrTok:=calck_Less;
          Result:=calck_Less;
         end;
       end;
  '>': begin
        CurrTok:=calck_Plus;
        Result:=calck_Plus;
       end;
  else begin
        if TempStr = 'NOT' then
         begin
          CurrTok:=calck_Not;
          Result:=calck_Not;
          exit;
         end;
        if TempStr = 'OR' then
         begin
          CurrTok:=calck_Or;
          Result:=calck_Or;
          exit;
         end;
        if TempStr = 'AND' then
         begin
          CurrTok:=calck_And;
          Result:=calck_And;
          exit;
         end;
        if TempStr = VAL_END then
         begin
          CurrTok:=calck_End;
          Result:=calck_End;
          exit;
         end;
        raise EunCalckError.Create(ERROR_EXPRESSION_SYNTAX);
       end;
 end;
end;

function TunStalker.Bool: Variant;
var Left: Variant;
begin
 Left:=Expr;
 while true do
  begin
   case CurrTok of
             calck_Or: begin
                        GetTuken;
                        Left:=Left or Expr;
                       end;
            calck_And: begin
                        GetTuken;
                        Left:=Left and Expr;
                       end;
       calck_Equality: begin
                        GetTuken;
                        Left:=Left = Expr;
                       end;
    calck_NotEquality: begin
                        GetTuken;
                        Left:=Left <> Expr;
                       end;
           calck_Less: begin
                        GetTuken;
                        Left:=Left < Expr;
                       end;
           calck_More: begin
                        GetTuken;
                        Left:= Left > Expr;
                       end;
                else begin
                      Result:=Left;
                      break;
                     end;
   end;
  end;
end;

function TunStalker.Expr: Variant;
var Left: Variant;
begin
 Left:=Term;
 while true do
  begin
   case CurrTok of
     calck_Plus: begin
                  GetTuken;
                  Left:=Left+Term;
                 end;
    calck_Minus: begin
                  GetTuken;
                  Left:=Left-Term;
                 end;
            else begin
                  Result:=Left;
                  break;
                 end;
   end;
  end;
end;

function TunStalker.Term: Variant;
var Left, D: Variant;
begin
 Left:=Prim;
 while true do
  begin
   case CurrTok of
    calck_Mul: begin
                GetTuken;
                Left:=Left*Prim;
               end;
    calck_Div: begin
                GetTuken;
                D:=Prim;
                if D = 0 then
                 raise EunCalckError.Create(ERROR_DIV_0);
                Left:=Left/D;
               end;
          else begin
                Result:=Left;
                break;
               end;
   end;
  end;
end;

function TunStalker.Prim: Variant;
var E: Variant;
    FuncName: string;
    ExtName: string;
    VarName: string;
    Index: Integer;
begin
 case CurrTok of
  calck_Value: begin
                GetTuken;
                if isLastString then
                 Result:=Self.LastString
                else
                 Result:=LastValue;
               end;
   calck_Name: begin
                VarName:=LastName;
                if GetTuken = calck_Assign then
                 begin
                  VarName:=LastName;
                  if Variables.Check(VarName) then
                   begin
                    GetTuken;
                    Variables.Val[VarName]:=Bool;
                    Result:=Variables.Val[VarName];
                   end
                  else
                   raise EunCalckError.Create(ERROR_DONT_FIND_VARIABLE);
                 end
                else
                 Result:=Variables.Val[VarName];
               end;
    calck_Not: begin
                GetTuken;
                Result:=not Prim;
               end;
  calck_Minus: begin
                GetTuken;
                Result:= - Prim;
               end;
     calck_LP: begin
                GetTuken;
                E:=Bool;
                if CurrTok <> calck_RP then
                 begin
                  while CurrTok = calck_Push do
                   begin
                    FStack.Push(E);
                    GetTuken;
                    E:=Bool;
                   end;
                  if CurrTok <> calck_RP then
                   raise EunCalckError.Create(ERROR_NOT_PR);
                 end;
                GetTuken;
                Result:=E;
               end;
     calck_LM: begin
                FStack.Push('[');
                GetTuken;
                E:=Bool;
                if CurrTok <> calck_RM then
                 raise EunCalckError.Create(ERROR_NOT_PR);
                FStack.Push(']');
                GetTuken;
                Result:=E;
               end;
      calck_Function: begin
                       FuncName:=LastName;
                       Index:=FFunctions.IndexByName(FuncName);
                       GetTuken;
                       if FFunctions.FuncParamCount[Index] > 0 then
                        begin
                         E:=Prim;
                         FStack.Push(E);
                        end
                       else
                        begin
                         if CurrTok = calck_LP then
                          begin
                           GetTuken;
                           GetTuken;
                          end;
                        end;
                       Result:=CreateFunction(Index);
                      end;
          calck_Push: begin
                       FStack.Push(LastValue);
                       GetTuken;
                       Bool;
                      end;
  calck_ExternalName: begin
                       ExtName:=LastName;
                       Index:=FExternals.IndexByInternalName(ExtName);
                       GetTuken;
                       if FExternals.ExternalParamCount[Index] > 0 then
                        begin
                         E:=Prim;
                         FStack.Push(E);
                        end
                       else
                        begin
                         while (CurrTok = calck_LP) or (CurrTok = calck_RP) do
                          GetTuken;
                        end;
                       Result:=DoGetExternalValue(Index);
                      end;
           calck_End: begin
                       Result:=1;
                      end;
  else raise EunCalckError.Create(ERROR_NOT_END_OF_PROGRAMM);
 end;
end;

function TunStalker.CreateFunction(const Index: Integer): Variant;
begin
 Result:=FFunctions.Execute(Index);
end;

function TunStalker.DoGetExternalValue(const Index: Integer): Variant;
var I: Integer;
    Ext: TunExternalName;
begin
 Ext:=FExternals.ExternalName[Index];
 for I:=0 to Ext.ParamCount-1 do
  begin
   Ext.Param[Ext.ParamCount-I-1]:=FStack.Pop;
  end;
 Result:=Ext.Execute;
end;

end.
