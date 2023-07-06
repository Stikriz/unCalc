unit IntegerDialogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DialogForm, StdCtrls, Spin, Buttons;

type
  TfInputIntegerDialog = class(TfDialog)
    SpinEdit1: TSpinEdit;
  private
    { Private declarations }
  protected
    function GetSectionName: string; override;
  public
    { Public declarations }
  end;

var
  fInputIntegerDialog: TfInputIntegerDialog;

implementation

{$R *.DFM}

{ TfInputIntegerDialog }

function TfInputIntegerDialog.GetSectionName: string;
begin
 Result:='fInputIntegerDialog';
end;

end.
