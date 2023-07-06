unit TimeDialogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DialogForm, ComCtrls, StdCtrls, Buttons;

type
  TfInputTime = class(TfDialog)
    DateTimePicker1: TDateTimePicker;
  private
    { Private declarations }
  protected
    function GetSectionName: string; override;
  public
    { Public declarations }
  end;

var
  fInputTime: TfInputTime;

implementation

{$R *.DFM}

{ TfInputTime }

function TfInputTime.GetSectionName: string;
begin
 Result:='fInputTime';
end;

end.
