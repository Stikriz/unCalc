unit unExternals;

interface

 uses SysUtils, classes, unCalckConstants;

 Type

 TExternalFunction = procedure(const AName: string; Tag: Integer; const Params: Variant; var _Result: Variant) of Object;

  TunExternals = class;

  TunExternalName = class(TObject)
   private
    FName: string;
    FLikeName: string;
    FOnExecute: TExternalFunction;
    FParams: Variant;
    FParamCount: Integer;
    FTag: Integer;
    FOwner: TunExternals;
    function GetParam(const Index: Integer): Variant;
    procedure SetParam(const Index: Integer; const Value: Variant);
   protected
   public
    constructor Create(const AName: string; const _ParamCount: Integer); virtual;
    destructor Destroy; override;
    property Owner: TunExternals read FOwner write FOwner;
    property ParamCount: Integer read FParamCount;
    property Param[const Index: Integer]: Variant read GetParam write SetParam;  default;
    property Name: string read FName;
    property LikeName: string read FLikeName;
    function Execute: Variant;
    property Tag: Integer read FTag write FTag;
    property OnExecute: TExternalFunction read FOnExecute write FOnExecute;
  end;

  TunExternals = class(TObject)
   private
    FListExternals: TList;
    function GetCount: Integer;
    function GetExternalName(const Index: Integer): TunExternalName;
    function GetExtParamCount(const Index: Integer): Integer;
   protected
    procedure Clear;
   public
    constructor Create;
    destructor Destroy; override;
    function IndexByName(const AName: string): Integer;
    function IndexByInternalName(AName: string): Integer;
    procedure AddExternal(const AName: string; ATag: Integer; const Executes: TExternalFunction; const ParamCount: Integer);
    property Count: Integer read GetCount;
    property ExternalName[const Index: Integer]: TunExternalName read GetExternalName;
    property ExternalParamCount[const Index: Integer]: Integer read GetExtParamCount;
  end;

implementation

uses unFunctionsClk, Variants;

{ TunExternalName }

constructor TunExternalName.Create(const AName: string; const _ParamCount: Integer);
var I: Integer;
begin
 inherited Create;
 FName:=AnsiUpperCase(AName);
 FLikeName:=AName;
 FParamCount:=_ParamCount;
 if _ParamCount > 0 then
  FParams:=VarArrayCreate([0, _ParamCount-1], varVariant);
 for I:=0 to FParamCount-1 do
  begin
   FParams[I]:='';
  end;
end;

destructor TunExternalName.Destroy;
begin
  inherited;
end;

function TunExternalName.Execute: Variant;
begin
 if Assigned(FOnExecute) then
  FOnExecute(FName, FTag, FParams, Result);
end;

function TunExternalName.GetParam(const Index: Integer): Variant;
begin
 if Index < 0 then
  raise EunCalckError.Create(ERROR_INDEX_PARAM);
 if ParamCount > Index then
  Result:=FParams[Index]
 else
  raise EunCalckError.Create(ERROR_INDEX_PARAM);
end;

procedure TunExternalName.SetParam(const Index: Integer;
  const Value: Variant);
begin
 if Index < 0 then
  raise EunCalckError.Create(ERROR_INDEX_PARAM);
 if ParamCount > Index then
  FParams[Index]:=Value
 else
  raise EunCalckError.Create(ERROR_INDEX_PARAM);
end;

{ TunExternals }

constructor TunExternals.Create;
begin
 inherited Create;
 FListExternals:=TList.Create;
end;

destructor TunExternals.Destroy;
begin
 Clear;
 FListExternals.Free;
  inherited;
end;

procedure TunExternals.Clear;
var Ext: TunExternalName;
    I: Integer;
begin
 for I:=0 to FListExternals.Count-1 do
  begin
   Ext:=FListExternals[I];
   Ext.Free;
  end;
 FListExternals.Clear;
end;

function TunExternals.GetExternalName(const Index: Integer): TunExternalName;
begin
 Result:=FListExternals[Index];
end;

procedure TunExternals.AddExternal(const AName: string; ATag: Integer;
  const Executes: TExternalFunction; const ParamCount: Integer);
var Ext: TunExternalName;
begin
 Ext:=TunExternalName.Create(AName, ParamCount);
 FListExternals.Add(Ext);
 Ext.Tag:=ATag;
 Ext.OnExecute:=Executes;
 Ext.Owner:=Self;
end;

function TunExternals.GetCount: Integer;
begin
 Result:=FListExternals.Count;
end;

function TunExternals.IndexByName(const AName: string): Integer;
var I: Integer;
    Ext: TunExternalName;
    isOk: boolean;
begin
 isOk:=false;
 Result:=-1;
 for I:=0 to FListExternals.Count-1 do
  begin
   Ext:=FListExternals[I];
   if Ext.Name = AName then
    begin
     Result:=I;
     isOk:=true;
     break;
    end;
  end;
 if not isOk then
  raise EunCalckError.Create(ERROR_FIND_EXTERNAL);
end;

function TunExternals.GetExtParamCount(const Index: Integer): Integer;
var Ext: TunExternalName;
begin
 Ext:=FListExternals[Index];
 Result:=Ext.ParamCount;
end;

function TunExternals.IndexByInternalName(AName: string): Integer;
begin
 AName[1]:=' ';
 Result:=StrToInt(Trim(AName));
end;

end.
