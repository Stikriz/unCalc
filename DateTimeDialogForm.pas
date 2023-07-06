unit DateTimeDialogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DialogForm, ComCtrls, StdCtrls, Buttons;

type
  TfInputDateTime = class(TfDialog)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
  private
    { Private declarations }
  protected
    function GetSectionName: string; override;
  public
    { Public declarations }
  end;

var
  fInputDateTime: TfInputDateTime;

implementation

{$R *.DFM}

{ TfInputDateTime }

function TfInputDateTime.GetSectionName: string;
begin
 Result:='fInputDateTime';
end;

end.
