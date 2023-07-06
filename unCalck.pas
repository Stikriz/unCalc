unit unCalck;

interface

 uses classes, sysutils, unCompiler, unStack, unVariables, unStalker,
      unExternals, unCalckConstants, unFunctionsClk, UnUDBFunctions;

 Type

  TunCalck = class(TComponent)
   private
    FCompiler: TunCompiler;
    FStack: TunStack;
    FSubStack: TunStack;
    FVariables: TunVariables;
    FFunctions: TunFunctions;
    FStalker: TunStalker;
    FExternals: TunExternals;
    FIsBazy: boolean;
    FTag1: Integer;
    FTag2: Integer;
    function GetCompProgramm: TStringList;
    function GetProgramm: TStringList;
    function GetVariable(const AName: string): Variant;
    procedure SetVariable(const AName: string; const AVal: Variant);
    function GetIsDebug: boolean;
    procedure SetIsDebug(const Value: boolean);
   protected
    procedure DoCheckName(const VarName: string; var TypeName: TEnumToken;
                                                      var InternalName: string);
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Compile;
    function Run: Variant;
    procedure SaveContextToStream(Str: TStream);
    procedure LoadContextFromStream(Str: TStream);
    property Programm: TStringList read GetProgramm;
    property CompilerProgramm: TStringList read GetCompProgramm;
    property Variable[const AName: string]: Variant read GetVariable write SetVariable;
    property Variables: TunVariables read FVariables;
    property Functions: TunFunctions read FFunctions;
    property Externals: TunExternals read FExternals;
    property IsBazy: boolean read FIsBazy write FIsBazy;
   published
    property IsDebug: boolean read GetIsDebug write SetIsDebug;
    property Tag1: Integer read FTag1 write FTag1;
    property Tag2: Integer read FTag2 write FTag2;
  end;

    procedure Register;  

implementation

{ TunCalck }

constructor TunCalck.Create(AOwner: TComponent);
begin
  inherited;
 FCompiler:=TunCompiler.Create;
 FCompiler.OnCheckNames:=DoCheckName;
 FStack:=TunStack.Create;
 FSubStack:=TunStack.Create;
 FVariables:=TunVariables.Create;
 FFunctions:=TunFunctions.Create;
 FFunctions.Stack:=FStack;
 FExternals:=TunExternals.Create;
 FStalker:=TunStalker.Create;
 FStalker.Variables:=FVariables;
 FStalker.Stack:=FStack;
 FStalker.SubStack:=FSubStack;
 FStalker.Compiler:=FCompiler;
 FStalker.Functions:=FFunctions;
 FStalker.Externals:=FExternals;
 FFunctions.ACompiler:=FCompiler;
 FFunctions.AStalker:=FStalker;
end;

destructor TunCalck.Destroy;
begin
 FCompiler.Free;
 FStack.Free;
 FVariables.Free;
 FFunctions.Free;
 FStalker.Free;
 FExternals.Free;
 FSubStack.Free;
  inherited;
end;

procedure TunCalck.Compile;
begin
 FCompiler.Compile;
end;

function TunCalck.GetCompProgramm: TStringList;
begin
 Result:=FCompiler.CompilerProgramm;
end;

function TunCalck.GetProgramm: TStringList;
begin
 Result:=FCompiler.Programm;
end;

function TunCalck.GetVariable(const AName: string): Variant;
var I: Integer;
    isOk: boolean;
begin
 isOk:=false;
 for I:=0 to FVariables.Count-1 do
  begin
   if FVariables.NameVar[I] = AName then
    begin
     Result:=FVariables.Value[I];
     isOk:=true;
     break;
    end;
  end;
 if not isOk then
  raise EunCalckError.Create(ERROR_DONT_FIND_VARIABLE + ' Name = "'+AName+'".');
end;

procedure TunCalck.SetVariable(const AName: string; const AVal: Variant);
begin
 FVariables.Send(AName, AVal);
end;

procedure TunCalck.DoCheckName(const VarName: string;
  var TypeName: TEnumToken; var InternalName: string);
var I: Integer;
    isOk: boolean;
begin
 if FStalker.isReservedWords(VarName) then
  begin
   InternalName:=VarName;
   TypeName:=calck_None;
   exit;
  end;
 isOk:=false;
 for I:=0 to FExternals.Count-1 do
  begin
   if FExternals.ExternalName[I].Name = VarName then
    begin
     TypeName:=calck_ExternalName;
     InternalName:='!'+IntToStr(I);
     isOk:=true;
     break;
    end;
  end;
 if isOk then exit;
 for I:=0 to FFunctions.Count-1 do
  begin
   if FFunctions.FuncName[I] = VarName then
    begin
     TypeName:=calck_Function;
     InternalName:=FFunctions.InternalFuncName[I];
     isOk:=true;
     break;
    end;
  end;
 if isOk then exit;
 for I:=0 to FVariables.Count-1 do
  begin
   if FVariables.NameVar[I] = VarName then
    begin
     TypeName:=calck_Name;
     InternalName:=FVariables.IntNameVar[I];
     isOk:=true;
     break;
    end;
  end;
 if isOk then exit;
 FVariables.Send(VarName, 0);
 TypeName:=calck_Name;
 InternalName:=FVariables.TranslateName(VarName);
end;

function TunCalck.Run: Variant;
var AOldTimeSeparator: Char;
    AOldDateSeparator: Char;
    AOldDecimalSeparator: Char;
begin
 if IsDebug then
  begin
   if Trim(Programm.Text) <> '' then
    FCompiler.Compile
   else if Trim(CompilerProgramm.Text) <> '' then
     FCompiler.FastCompile
   else
    exit;
  end
 else
  if Trim(CompilerProgramm.Text) = '' then
   exit
  else
   FCompiler.Position:=0;
 try
  AOldTimeSeparator:=FormatSettings.TimeSeparator;
  AOldDateSeparator:=FormatSettings.DateSeparator;
  AOldDecimalSeparator:=FormatSettings.DecimalSeparator;
  FormatSettings.TimeSeparator:=':';
  FormatSettings.DateSeparator:='.';
  FormatSettings.DecimalSeparator:='.';
  FStalker.Run;
  FormatSettings.TimeSeparator:=AOldTimeSeparator;
  FormatSettings.DateSeparator:=AOldDateSeparator;
  FormatSettings.DecimalSeparator:=AOldDecimalSeparator;
 except on E: Exception do
  begin
   E.Message:=CheckErrorMessage(E.Message);
   if E.Message = '' then
    E.Message:=FStalker.OldErrorMessage
   else
    E.Message:=CheckErrorMessage(E.Message);
    E.Message:=E.Message+CLR+STR_1+IntToStr(FCompiler.ProgrammString)+CLR+
     STR_2+IntToStr(FCompiler.ProgrammChar)+CLR+Programm[FCompiler.ProgrammString - 1];
   raise;
  end;
 end;
 Result:=FVariables.Value[0];
end;

function TunCalck.GetIsDebug: boolean;
begin
 Result:=FCompiler.IsDebug;
end;

procedure TunCalck.SetIsDebug(const Value: boolean);
begin
 FCompiler.IsDebug:=Value;
end;

procedure TunCalck.LoadContextFromStream(Str: TStream);
begin
end;

procedure TunCalck.SaveContextToStream(Str: TStream);
begin

end;

procedure Register;
begin
  RegisterComponents('UnLibrary', [TunCalck]);
end;

end.
