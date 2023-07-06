unit DialogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, inifiles, unCalckConstants, UnConstants;

type
  TfDialog = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    lMessage: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   FNextStep: Integer;
  protected
    function GetSectionName: string; virtual;
  public
    HelpIndex: Integer;
    property SectionName: string read GetSectionName;
  end;

var
  fDialog: TfDialog;

implementation

uses ActnList, menus, UnUDBFunctions;

{$R *.DFM}

procedure TfDialog.BitBtn3Click(Sender: TObject);
begin
 Application.HelpContext(HelpIndex);
end;

procedure TfDialog.FormCreate(Sender: TObject);
var IniFile: TIniFile;
    TempStr: string;
begin
{ IniFile:=TIniFile.Create('UnCalckLang.lan');
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
//  CheckLanguige(FNextStep, IniFile, Self, SectionName);
 finally
  IniFile.Free;
 end;}
end;

function TfDialog.GetSectionName: string;
begin
 Result:='fDialog';
end;

end.
