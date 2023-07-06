unit unStack;

interface

 uses classes, unCalckConstants;

 Type

  TunStack = class(TObject)
   private
    FStack: Variant;
    function GetCount: Integer;
   protected
   public
    constructor Create;
    destructor Destroy; override;
    procedure Push(Val: Variant);
    function Pop: Variant;
    procedure Clear;
    property Count: Integer read GetCount;
  end;

implementation

{ TunStack }

uses Variants;

constructor TunStack.Create;
begin
 inherited Create;
 FStack:=VarArrayCreate([0, 0], varVariant);
 FStack[0]:=VAL_END;
end;

destructor TunStack.Destroy;
begin
  inherited;
end;

procedure TunStack.Clear;
begin
 VarArrayRedim(FStack, 0);
 FStack[0]:=VAL_END;
end;

procedure TunStack.Push(Val: Variant);
var MaxIndex: Integer;
    I: Integer;
begin
 MaxIndex:=VarArrayHighBound(FStack, 1);
 VarArrayRedim(FStack, MaxIndex+1);
 for I:=MaxIndex downto 0 do
  begin
   FStack[I+1]:=FStack[I];
  end;
 FStack[0]:=Val;
end;

function TunStack.Pop: Variant;
var MaxIndex: Integer;
    I: Integer;
//    AvarType: TVarType;
begin
 Result:=FStack[0];
 if String(Result) = VAL_END then
  raise EunCalckError.Create(ERROR_END_OF_STACK);
 MaxIndex:=VarArrayHighBound(FStack, 1);
 for I:=0 to MaxIndex-1 do
  begin
   FStack[I]:=Null;
   FStack[I]:=FStack[I+1];
  end;
 VarArrayRedim(FStack, MaxIndex-1);
end;

function TunStack.GetCount: Integer;
begin
 Result:=VarArrayHighBound(FStack, 1);
end;

end.
