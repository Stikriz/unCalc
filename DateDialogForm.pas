unit DateDialogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DialogForm, StdCtrls, Buttons, ComCtrls;

type
  TfInputDate = class(TfDialog)
    mcInputDate: TDateTimePicker;
  private
    { Private declarations }
  protected
    function GetSectionName: string; override;
  public
    { Public declarations }
  end;

var
  fInputDate: TfInputDate;

implementation

{$R *.DFM}

{ TfInputDate }

function TfInputDate.GetSectionName: string;
begin
 Result:='fInputDate';
end;

end.
