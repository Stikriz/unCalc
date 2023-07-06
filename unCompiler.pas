unit unCompiler;

interface

 uses classes, Sysutils, unCalckConstants;

 Type

   TCheckNames = procedure(const VarName: string; var TypeName: TEnumToken;
                                          var InternalName: string) of Object;

   TLabel = class(TObject)
    private
    FPosition: Integer;
    FName: string;
    protected
    public
     property Position: Integer read FPosition write FPosition;
     property Name: string read FName write FName;
   end;

   TunCompiler = class(TObject)
    private
     FisCompile: boolean;
     FPosition: Integer;
     FProcramm: TStringList;
     FLastType: TEnumToken;
     FCompilerProgramm: TStringList;
     FOnCheckNames: TCheckNames;
     FProgrammString: Integer;
     FProgrammChar: Integer;
     FIsDebug: boolean;
     FListLabels: TList;
    protected
     procedure SetPosition(Val: Integer);
     function GetLexcem(const Index: Integer): string;
     procedure AddLex(var Str: string; const PrgNum, CrNum: Integer);
     procedure DoCheckName(var _Name: string);
    public
     constructor Create;
     destructor Destroy; override;
     procedure Clear;
     procedure Compile;
     procedure FastCompile;
     function GetNext: string;
     function FindString(const Str: string): Integer;
     property isCompile: boolean read FisCompile;
     property Position: Integer read FPosition write SetPosition;
     property Lexcem[const Index: Integer]: string read GetLexcem;
     property Programm: TStringList read FProcramm;
     property CompilerProgramm: TStringList read FCompilerProgramm;
     property ProgrammString: Integer read FProgrammString;
     property ProgrammChar: Integer read FProgrammChar;
     property OnCheckNames: TCheckNames read FOnCheckNames write FOnCheckNames;
     property IsDebug: boolean read FIsDebug write FIsDebug;
   end;

implementation

{ TunCompiler }

constructor TunCompiler.Create;
begin
 inherited;
 FisCompile:=false;
 FPosition:=0;
 FProcramm:=TStringList.Create;
 FCompilerProgramm:=TStringList.Create;
 FIsDebug:=false;
 FListLabels:=TList.Create;
end;

destructor TunCompiler.Destroy;
begin
 Clear;
 FProcramm.Free;
 FCompilerProgramm.Free;
 FListLabels.Free;
  inherited;
end;

procedure TunCompiler.Clear;
var I: Integer;
    ProgrammNum: TNum;
    Lab: TLabel;
begin
 for I:=0 to FCompilerProgramm.Count-1 do
  begin
   ProgrammNum:=FCompilerProgramm.Objects[I] as TNum;
   ProgrammNum.Free;
  end;
 FCompilerProgramm.Clear;
 for I:=0 to FListLabels.Count-1 do
  begin
   Lab:=FListLabels[I];
   Lab.Free;
  end;
 FListLabels.Clear;
 FisCompile:=false;
 FPosition:=0;
end;

function TunCompiler.FindString(const Str: string): Integer;
var I: Integer;
    Lab: TLabel;
begin
 Result:=-1;
 for I:=0 to FListLabels.Count-1 do
  begin
   Lab:=FListLabels[I];
   if Lab.Name = Str then
    begin
     Result:=Lab.Position;
     break;
    end;
  end;
 if Result = -1 then
  begin
   for I:=0 to FCompilerProgramm.Count-1 do
    begin
     if FCompilerProgramm[I] = Str then
      begin
       Result:=I;
       Lab:=TLabel.Create;
       FListLabels.Add(Lab);
       Lab.Position:=Result;
       Lab.Name:=Str;
       break;
      end;
    end;
  end;
end;

function TunCompiler.GetLexcem(const Index: Integer): string;
begin
 Result:=FCompilerProgramm[Index];
end;

function TunCompiler.GetNext: string;
var NumStr: TNum;
begin
 if FCompilerProgramm.Count > FPosition then
  begin
   Result:=FCompilerProgramm[FPosition];
   if FIsDebug then
    begin
     NumStr:=FCompilerProgramm.Objects[FPosition] as TNum;
     FProgrammString:=NumStr.StrNum;
     FProgrammChar:=NumStr.CharNum;
    end;
   FPosition:=FPosition+1;
  end
 else
  raise EunCalckError.Create(ERROR_NOT_END_OF_PROGRAMM);
end;

procedure TunCompiler.SetPosition(Val: Integer);
begin
 if (Val >= 0) and (FCompilerProgramm.Count > Val) then
  FPosition:=Val
 else
  raise EunCalckError.Create(ERROR_SET_POSITION_PROGRAMM);
end;

procedure TunCompiler.Compile;
var I, J: Integer;
    TempString: string;
    LengthString: Integer;
    Lex: string;
    isOk: boolean;
    LeftSkb: Integer;
    RightSkb: Integer;
begin
 LeftSkb:=0;
 RightSkb:=0;
 Clear;
 FProgrammString:=0;
 FProgrammChar:=0;
 if FProcramm.Count = 0 then
  raise EunCalckError.Create(ERROR_NULL_PROGRAMM);
 for I:=0 to FProcramm.Count-1 do
  begin
   TempString:=Trim(FProcramm[I]);
   J:=1;
   LengthString:=Length(TempString);
   Lex:='';
   while J <= LengthString do
    begin
     case TempString[J] of
      ' ', ';': begin
                 DoCheckName(Lex);
                 AddLex(Lex, I, J);
           end;
      '.': begin
            DoCheckName(Lex);
            if FLastType = calck_ExternalName then
             begin
              AddLex(Lex, I, J);
              Lex:='.';
              AddLex(Lex, I, J);
             end
            else
             Lex:=Lex+'.'
           end;
      ':': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            while J <= LengthString do
             begin
              if (TempString[J] <> ';') and (TempString[J] <> ' ') then
               Lex:=Lex+TempString[J]
              else
               break;
              J:=J+1;
             end;
            DoCheckName(Lex);
            AddLex(Lex, I, J);
           end;
      '+': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:='+';
            AddLex(Lex, I, J);
           end;
      '-': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:='-';
            AddLex(Lex, I, J);
           end;
      '*': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:='*';
            AddLex(Lex, I, J);
           end;
      '/': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            if Length(TempString) > J then
             begin
              if TempString[J+1] = '/' then
               break;
             end;
            Lex:='/';
            AddLex(Lex, I, J);
           end;
      ',': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:=',';
            AddLex(Lex, I, J);
           end;
      '"': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:=Lex+'"';
            J:=J+1;
            isOk:=false;
            while J <= LengthString do
             begin
              if TempString[J] = '"' then
               begin
                Lex:=Lex+'"';
                isOk:=true;
                break;
               end
              else
               Lex:=Lex+TempString[J];
              J:=J+1;
             end;
            if not isOk then
             raise EunCalckError.Create(ERROR_CREATE_STRING);
           end;
      '(': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:='(';
            AddLex(Lex, I, J);
            LeftSkb:=LeftSkb+1;
           end;
      ')': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:=')';
            AddLex(Lex, I, J);
            RightSkb:=RightSkb+1;
           end;

      '[': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:='[';
            AddLex(Lex, I, J);
            LeftSkb:=LeftSkb+1;
           end;
      ']': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:=']';
            AddLex(Lex, I, J);
            RightSkb:=RightSkb+1;
           end;

      '>': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            Lex:='>';
            AddLex(Lex, I, J);
           end;
      '<': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            if LengthString > J then
             begin
              J:=J+1;
              if TempString[J] = '>' then
               Lex:='<>'
              else
               begin
                Lex:='<';
                J:=J-1;
               end;
             end
            else
              Lex:='<';
            AddLex(Lex, I, J);
           end;
      '=': begin
            DoCheckName(Lex);
            AddLex(Lex, I, J);
            if LengthString > J then
             begin
              J:=J+1;
              if TempString[J] = '=' then
               Lex:='=='
              else
               begin
                Lex:='=';
                J:=J-1;
               end;
             end
            else
              Lex:='=';
            AddLex(Lex, I, J);
           end;
      else Lex:=Lex+TempString[J];
     end;
      J:=J+1;
    end;
   DoCheckName(Lex); 
   AddLex(Lex, I, J);
  end;     
 if LeftSkb <> RightSkb then
  raise EunCalckError.Create(ERROR_SKOBKI);
end;

procedure TunCompiler.AddLex(var Str: string; const PrgNum, CrNum: Integer);
var ProgrammNum: TNum;
begin
 Str:=Trim(Str);
 if Length(Str) > 0 then
  begin
   ProgrammNum:=TNum.Create;
   FCompilerProgramm.AddObject(Str, ProgrammNum);
   ProgrammNum.StrNum:=PrgNum;
   ProgrammNum.CharNum:=CrNum;
  end;
 Str:='';
end;

procedure TunCompiler.DoCheckName(var _Name: string);
var TypeVal: TEnumToken;
    IntName: string;
begin
 _Name:=Trim(_Name);
 if Length(_Name) > 0 then
  begin
   if _Name[1] <> '"' then
    _Name:=AnsiUpperCase(_Name);
   if Assigned(FOnCheckNames) then
    begin
     FOnCheckNames(_Name, TypeVal, IntName);
     FLastType:=TypeVal;
     _Name:=IntName;
    end
   else
    FLastType:=calck_None;
  end;
end;

procedure TunCompiler.FastCompile;
var I: Integer;
    Lex: string;
    TypeVal: TEnumToken;
    IntName: string;
begin
 for I:=0 to FCompilerProgramm.Count-1 do
  begin
   Lex:=FCompilerProgramm[I];
   if Length(Lex) > 0 then
    if Lex[1] = '^' then
     begin
      if Assigned(FOnCheckNames) then
       begin
        Lex[1]:='V';
        FOnCheckNames(Lex, TypeVal, IntName);
        FCompilerProgramm[I]:=IntName;
       end
     end;
  end;
 FPosition:=0;
end;

end.
