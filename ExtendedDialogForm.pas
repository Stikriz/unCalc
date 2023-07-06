unit ExtendedDialogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DialogForm, StdCtrls, Buttons, unCalckConstants;

type
  TfInputExtendedDialog = class(TfDialog)
    eValue: TEdit;
    procedure eValueExit(Sender: TObject);
    procedure eValueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
   function GetSectionName: string; override;
  public
    { Public declarations }
  end;

var
  fInputExtendedDialog: TfInputExtendedDialog;

implementation

{$R *.DFM}

procedure TfInputExtendedDialog.eValueExit(Sender: TObject);
begin
  inherited;
 try
   StrToFloat(eValue.Text);
 except on Exception do begin
   eValue.SetFocus;
   MessageDlg(STR_3, mtError, [mbOk], 0);
   Abort;
  end;
 end;
end;

procedure TfInputExtendedDialog.eValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if not ((Key >= '0') and (Key <= '9')) then
  if not((Key = FormatSettings.DecimalSeparator) or (Key = #8)) then
   Key:=#0;
end;

function TfInputExtendedDialog.GetSectionName: string;
begin
 Result:='fDialog';
end;

end.
