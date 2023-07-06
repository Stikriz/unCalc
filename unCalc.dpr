program unCalc;

uses
  Vcl.Forms,
  DateDialogForm in 'DateDialogForm.pas' {fInputDate},
  DateTimeDialogForm in 'DateTimeDialogForm.pas' {fInputDateTime},
  EnvironmentOptionsForm in 'EnvironmentOptionsForm.pas' {fEnvOptions},
  ExtendedDialogForm in 'ExtendedDialogForm.pas' {fInputExtendedDialog},
  findForm in 'findForm.pas' {frmFind},
  IntegerDialogForm in 'IntegerDialogForm.pas' {fInputIntegerDialog},
  StringDialogForm in 'StringDialogForm.pas' {fInputString},
  TimeDialogForm in 'TimeDialogForm.pas' {fInputTime},
  frmMain in 'frmMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
