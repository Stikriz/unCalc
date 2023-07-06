unit StringDialogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DialogForm, StdCtrls, Buttons;

type
  TfInputString = class(TfDialog)
    eInputString: TEdit;
  private
    { Private declarations }
  protected
    function GetSectionName: string; override;
  public
    { Public declarations }
  end;

var
  fInputString: TfInputString;

implementation

{$R *.DFM}

{ TfInputString }

function TfInputString.GetSectionName: string;
begin
 Result:='fInputString';
end;

end.
