unit unVariables;

interface

 uses classes, Sysutils, unCalckConstants;

 Type

  TunVariable = class(TObject)
   private
    FValue: Variant;
    FName: string;
    FInternalName: string;
    FCaption: string;
    FShowName: string;
   protected
   public
    constructor Create(const AName, AIntName: string; const Val: Variant); virtual;
    Destructor Destroy; override;
    property Value: Variant read FValue write FValue;
    property Name: string read FName;
    property InternalName: string read FInternalName;
    property Caption: string read FCaption;
    property ShowName: string read FShowName;
  end;

  TunVariables = class(TObject)
   private
    FVariables: TList;
    function GetIntNameVar(const Index: Integer): string;
    function GetTunVariable(const Index: Integer): TunVariable;
   protected
    function GetNameVar(const Index: Integer): string;
    function GetVal(const AName: string): Variant;
    function GetValue(const Index: Integer): Variant;
    procedure SetVal(const AName: string; const AVal: Variant);
    procedure SetValue(const Index: Integer; const AVal: Variant);
    function GetCount: Integer;
   public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Send(const AName: string; const AVal: Variant);
    function Check(const AName: string): boolean;
    function TranslateName(const AName: string): string;
    procedure AddVariable(const AName, ACaption: string; const Val: Variant);
    property Count: Integer read GetCount;
    property Value[const Index: Integer]: Variant read GetValue write SetValue; default;
    property NameVar[const Index: Integer]: string read GetNameVar;
    property IntNameVar[const Index: Integer]: string read GetIntNameVar;
    property Val[const AName: string]: Variant read GetVal write SetVal;
    property Variable[const Index: Integer]: TunVariable read GetTunVariable;
  end;

implementation

{ TunVariable }

constructor TunVariable.Create(const AName, AIntName: string; const Val: Variant);
begin
 inherited Create;
 FName:=AName;
 FInternalName:=AIntName;
 FValue:=Val;
end;

destructor TunVariable.Destroy;
begin
  inherited;
end;

{ TunVariables }

constructor TunVariables.Create;
begin
 inherited Create;
 FVariables:=TList.Create;

 AddVariable('Result', 'The value returned from the calculator (It is used not always)', 0);
 AddVariable('True', 'It is TRUE', true);
 AddVariable('False', 'It is FALSE', false);
 AddVariable('Pi', 'Pi = 3.1415926535897932385', Pi);
 AddVariable('Clr', '#13#10', #13#10);
end;

destructor TunVariables.Destroy;
begin
 Clear;
 FVariables.Free;
  inherited;
end;

procedure TunVariables.Clear;
var DelVar: TunVariable;
    I: Integer;
begin
 for I:=0 to FVariables.Count-1 do
  begin
   DelVar:=FVariables[I];
   DelVar.Free;
  end;
 FVariables.Clear;
end;

function TunVariables.GetCount: Integer;
begin
 Result:=FVariables.Count;
end;

function TunVariables.Check(const AName: string): boolean;
var NameVar: string;
begin
 NameVar:=AName;
 NameVar[1]:=' ';
 Result:=StrToInt(Trim(NameVar))< FVariables.Count;
end;

function TunVariables.GetNameVar(const Index: Integer): string;
var FindVar: TunVariable;
begin
 FindVar:=FVariables[Index];
 Result:=FindVar.Name;
end;

procedure TunVariables.Send(const AName: string; const AVal: Variant);
var FindVar: TunVariable;
    I: Integer;
    isOk: boolean;
begin
 isOk:=false;
 for I:=0 to FVariables.Count-1 do
  begin
   FindVar:=FVariables[I];
   if FindVar.Name = AName then
    begin
     FindVar.Value:=AVal;
     isOk:=true;
     break;
    end;
  end;
 if not isOk then
  begin
   FindVar:=TunVariable.Create(AName, '^'+IntToStr(FVariables.Count), AVal);
   FVariables.Add(FindVar);
  end;
end;

function TunVariables.GetVal(const AName: string): Variant;
var FindVar: TunVariable;
    VarName: string;
begin
 VarName:=AName;
 VarName[1]:=' ';
 FindVar:=FVariables[StrToInt(Trim(VarName))];
 Result:=FindVar.Value;
end;

procedure TunVariables.SetVal(const AName: string; const AVal: Variant);
var FindVar: TunVariable;
    VarName: string;
begin
 VarName:=AName;
 VarName[1]:=' ';
 FindVar:=FVariables[StrToInt(Trim(VarName))];
 FindVar.Value:=AVal;
end;

function TunVariables.GetValue(const Index: Integer): Variant;
var FindVar: TunVariable;
begin
 FindVar:=FVariables[Index];
 Result:=FindVar.Value;
end;

procedure TunVariables.SetValue(const Index: Integer; const AVal: Variant);
var FindVar: TunVariable;
begin
 FindVar:=FVariables[Index];
 FindVar.Value:=AVal;
end;

function TunVariables.TranslateName(const AName: string): string;
var FindVar: TunVariable;
    I: Integer;
    isOk: boolean;
begin
 isOk:=false;
 for I:=FVariables.Count-1 downto 0 do
  begin
   FindVar:=FVariables[I];
   if FindVar.Name = AName then
    begin
     Result:=FindVar.InternalName;
     isOk:=true;
     break;
    end;
  end;
 if not isOk then
  raise EunCalckError.Create(ERROR_DONT_FIND_VARIABLE);
end;

function TunVariables.GetIntNameVar(const Index: Integer): string;
var FindVar: TunVariable;
begin
 FindVar:=FVariables[Index];
 Result:=FindVar.InternalName;
end;

procedure TunVariables.AddVariable(const AName, ACaption: string; const Val: Variant);
var FindVar: TunVariable;
    I: Integer;
    isOk: boolean;
begin
 isOk:=false;
 for I:=0 to FVariables.Count-1 do
  begin
   FindVar:=FVariables[I];
   if FindVar.Name = AName then
    begin
     FindVar.Value:=Val;
     FindVar.FCaption:=ACaption;
     FindVar.FShowName:=AName;
     isOk:=true;
     break;
    end;
  end;
 if not isOk then
  begin
   FindVar:=TunVariable.Create(AnsiUpperCase(AName), '^'+IntToStr(FVariables.Count), Val);
   FVariables.Add(FindVar);
   FindVar.FCaption:=ACaption;
   FindVar.FShowName:=AName;
  end;
end;

function TunVariables.GetTunVariable(const Index: Integer): TunVariable;
begin
 Result:=FVariables[Index];
end;

end.
