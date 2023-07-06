unit findForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmFind = class(TForm)
    Label1: TLabel;
    cbFindText: TComboBox;
    GroupBox1: TGroupBox;
    cbMatchCase: TCheckBox;
    cbWholeWord: TCheckBox;
    btnFind: TButton;
    btnCancel: TButton;
    GroupBox2: TGroupBox;
    rbForward: TRadioButton;
    rbBackward: TRadioButton;
    GroupBox3: TGroupBox;
    rbGlobal: TRadioButton;
    rbSelectedOnly: TRadioButton;
    GroupBox4: TGroupBox;
    rbFromCursor: TRadioButton;
    rbEntireScope: TRadioButton;
    procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   FNextStep: Integer;
  public
    { Public declarations }
  end;

var
  frmFind: TfrmFind;

const
  SectionName = 'frmFind';

implementation

{$R *.dfm}

uses inifiles, UnConstants, UnUDBFunctions;

procedure TfrmFind.btnFindClick(Sender: TObject);
begin
 cbFindText.Items.Add( cbFindText.Text );
end;

procedure TfrmFind.FormCreate(Sender: TObject);
var IniFile: TIniFile;
    TempStr: string;
begin
 IniFile:=TIniFile.Create('UnCalckLang.lan');
 try
  self.Font.Name:=UnConstants.DefaultFontName;
  self.Font.Charset:=UnConstants.DefaultCharSet;
  //TempStr:=DeconvertString(IniFile.ReadString(Self.Name, Self.Name, ''));
  TempStr:=DeconvertString(IniFile.ReadString(SectionName, SectionName, ''));
  if TempStr = '' then
   begin
    if Self.Caption <> '' then
     IniFile.WriteString(SectionName, SectionName, ConvertString(Self.Caption));
     //IniFile.WriteString(Self.Name, Self.Name, ConvertString(Self.Caption));
   end
  else
   Self.Caption:=TempStr;
  FNextStep:=1;
 // CheckLanguige(FNextStep, IniFile, Self, SectionName);
 finally
  IniFile.Free;
 end;
end;

end.
