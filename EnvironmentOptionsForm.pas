unit EnvironmentOptionsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ColorGrd, ComCtrls, Buttons,
  IniFiles, UnConstants, UnUDBFunctions;
  //UnCalckSync, mwCustomEdit,mwHighlighter,

type
  TfEnvOptions = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    tsEditor: TTabSheet;
    GroupBox2: TGroupBox;
    cbAutoIndent: TCheckBox;
    cbDragDropEditing: TCheckBox;
    cbDropFiles: TCheckBox;
    cbHalfPageScroll: TCheckBox;
    cbScrollPastEol: TCheckBox;
    cbTabsToSpaces: TCheckBox;
    cbSmartTabs: TCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cbGutterVisible: TCheckBox;
    cbxGutterSize: TComboBox;
    cbShowLineNumbers: TCheckBox;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    ColorGrid: TColorGrid;
    cbBold: TCheckBox;
    cbItalic: TCheckBox;
    cbUnderline: TCheckBox;
    cbStrikeOut: TCheckBox;
    lbElement: TListBox;
    procedure FormShow(Sender: TObject);
procedure lbElementClick(Sender: TObject);
procedure ColorGridChange(Sender: TObject);
procedure cbBoldClick(Sender: TObject);
procedure cbItalicClick(Sender: TObject);
procedure cbUnderlineClick(Sender: TObject);
procedure cbStrikeOutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
//    FUnCalckSynh: TUnCalckSynh;
//    FEditor: TmwCustomEdit;
    FNextStep: Integer;
  public
    procedure GetCurrentSettings;
    procedure ApplyCurrentSettings;
//    procedure AssignOptions( Edit : TmwCustomEdit );

//    property UnCalckSynh: TUnCalckSynh read FUnCalckSynh write FUnCalckSynh;
//    property Editor: TmwCustomEdit read FEditor write FEditor;
  end;

var
  fEnvOptions: TfEnvOptions;

const
  SectionName = 'fEnvOptions';

implementation

{$R *.dfm}

procedure TfEnvOptions.FormShow(Sender: TObject);
begin
  inherited;
  GetCurrentSettings;
end;

procedure TfEnvOptions.ApplyCurrentSettings;
begin
{
  procedure AssignAttrs( FromHL, ToHL : TmwCustomHighLighter );
  var
    I : integer;
  begin
    for I := 0 to FromHL.AttrCount-1 do
      ToHL.Attribute[I].Assign( FromHL.Attribute[I] );
  end;

begin
 AssignAttrs(FUnCalckSynh, UnCalckSynh);
 AssignOptions(Editor);
 }
end;


//procedure TfEnvOptions.AssignOptions( Edit : TmwCustomEdit );
//begin
{
  if cbAutoIndent.Checked then
    Edit.Options := Edit.Options + [mweoAutoIndent]
  else
    Edit.Options := Edit.Options - [mweoAutoIndent];

  if cbDragDropEditing.Checked then
    Edit.Options := Edit.Options + [mweoDragDropEditing]
  else
    Edit.Options := Edit.Options - [mweoDragDropEditing];

  if cbDropFiles.Checked then
    Edit.Options := Edit.Options + [mweoDropFiles]
  else
    Edit.Options := Edit.Options - [mweoDropFiles];

  if cbHalfPageScroll.Checked then
    Edit.Options := Edit.Options + [mweoHalfPageScroll]
  else
    Edit.Options := Edit.Options - [mweoHalfPageScroll];

  if cbScrollPastEol.Checked then
    Edit.Options := Edit.Options + [mweoScrollPastEol]
  else
    Edit.Options := Edit.Options - [mweoScrollPastEol];

  if cbTabsToSpaces.Checked then
    Edit.Options := Edit.Options + [mweoTabsToSpaces]
  else
    Edit.Options := Edit.Options - [mweoTabsToSpaces];

  if cbSmartTabs.Checked then
    Edit.Options := Edit.Options + [mweoSmartTabs]
  else
    Edit.Options := Edit.Options - [mweoSmartTabs];

  if not cbGutterVisible.Checked then
    Edit.Gutter.Width := 0
  else begin
    Edit.Gutter.ShowLineNumbers := cbShowLineNumbers.Checked;
    Edit.Gutter.Width := StrToInt(cbxGutterSize.Text);
  end;
  }
//end;

procedure TfEnvOptions.GetCurrentSettings;
var I: Integer;
begin
{
    lbElement.Items.Clear;
    for i := 0 to UnCalckSynh.AttrCount - 1 do
      lbElement.Items.Add(UnCalckSynh.Attribute[i].Name);
    lbElement.ItemIndex := 0;



  cbAutoIndent.Checked := mweoAutoIndent in FEditor.Options;
  cbDragDropEditing.Checked := mweoDragDropEditing in FEditor.Options;
  cbDropFiles.Checked := mweoDropFiles in FEditor.Options;
  cbHalfPageScroll.Checked := mweoHalfPageScroll in FEditor.Options;
  cbScrollPastEol.Checked := mweoScrollPastEol in FEditor.Options;
  cbTabsToSpaces.Checked := mweoTabsToSpaces in FEditor.Options;
  cbSmartTabs.Checked := mweoSmartTabs in FEditor.Options;

  cbGutterVisible.Checked := FEditor.Gutter.Width > 0;
  cbShowLineNumbers.Checked := FEditor.Gutter.ShowLineNumbers;
  cbxGutterSize.Text := IntToStr(FEditor.Gutter.Width);
  }
end;

procedure TfEnvOptions.lbElementClick(Sender: TObject);
begin
{
var

  Attr: TmwHighLightAttributes;
begin
    Attr := TmwHighLightAttributes.Create('');
    try
      Attr.Assign(UnCalckSynh.Attribute[lbElement.ItemIndex]);
      ColorGrid.ForegroundIndex := ColorGrid.ColorToIndex(Attr.Foreground);
      ColorGrid.BackgroundIndex := ColorGrid.ColorToIndex(Attr.Background);

      cbBold.Checked := (fsBold in Attr.Style);
      cbItalic.Checked := (fsItalic in Attr.Style);
      cbUnderLine.Checked := (fsUnderline in Attr.Style);
      cbStrikeOut.Checked := (fsStrikeOut in Attr.Style);
    finally
      Attr.Free;
    end;
}
end;

procedure TfEnvOptions.ColorGridChange(Sender: TObject);
begin
{
var
  Attr: TmwHighLightAttributes;
  AttrStyle: TFontStyles;
begin
    Attr := TmwHighLightAttributes.Create(lbElement.Items[lbElement.ItemIndex]);
    try
       AttrStyle := [];
       Attr.Foreground := ColorGrid.ForegroundColor;
       Attr.Background := ColorGrid.BackgroundColor;
       if cbBold.Checked then
         Include(AttrStyle, fsBold);
       if cbItalic.Checked then
         Include(AttrStyle, fsItalic);
       if cbUnderLine.Checked then
         Include(AttrStyle, fsUnderline);
       if cbStrikeOut.Checked then
         Include(AttrStyle, fsStrikeOut);
       Attr.Style := AttrStyle;
       UnCalckSynh.Attribute[lbElement.ItemIndex].Assign(Attr);
    finally
      Attr.Free;
    end;
    }
end;

procedure TfEnvOptions.cbBoldClick(Sender: TObject);
begin
{
var
  Attr: TmwHighLightAttributes;
  AttrStyle: TFontStyles;
begin
    Attr := TmwHighLightAttributes.Create(lbElement.Items[lbElement.ItemIndex]);
    try
       AttrStyle := [];
       Attr.Foreground := ColorGrid.ForegroundColor;
       Attr.Background := ColorGrid.BackgroundColor;
       if cbBold.Checked then
         Include(AttrStyle, fsBold);
       if cbItalic.Checked then
         Include(AttrStyle, fsItalic);
       if cbUnderLine.Checked then
         Include(AttrStyle, fsUnderline);
       if cbStrikeOut.Checked then
         Include(AttrStyle, fsStrikeOut);
       Attr.Style := AttrStyle;
       UnCalckSynh.Attribute[lbElement.ItemIndex].Assign(Attr);
    finally
      Attr.Free;
    end;
    }
end;

procedure TfEnvOptions.cbItalicClick(Sender: TObject);
begin
{
var
  Attr: TmwHighLightAttributes;
  AttrStyle: TFontStyles;
begin
    Attr := TmwHighLightAttributes.Create(lbElement.Items[lbElement.ItemIndex]);
    try
       AttrStyle := [];
       Attr.Foreground := ColorGrid.ForegroundColor;
       Attr.Background := ColorGrid.BackgroundColor;
       if cbBold.Checked then
         Include(AttrStyle, fsBold);
       if cbItalic.Checked then
         Include(AttrStyle, fsItalic);
       if cbUnderLine.Checked then
         Include(AttrStyle, fsUnderline);
       if cbStrikeOut.Checked then
         Include(AttrStyle, fsStrikeOut);
       Attr.Style := AttrStyle;
       UnCalckSynh.Attribute[lbElement.ItemIndex].Assign(Attr);
    finally
      Attr.Free;
    end;
    }
end;

procedure TfEnvOptions.cbUnderlineClick(Sender: TObject);
begin
{
var
  Attr: TmwHighLightAttributes;
  AttrStyle: TFontStyles;
begin
    Attr := TmwHighLightAttributes.Create(lbElement.Items[lbElement.ItemIndex]);
    try
       AttrStyle := [];
       Attr.Foreground := ColorGrid.ForegroundColor;
       Attr.Background := ColorGrid.BackgroundColor;
       if cbBold.Checked then
         Include(AttrStyle, fsBold);
       if cbItalic.Checked then
         Include(AttrStyle, fsItalic);
       if cbUnderLine.Checked then
         Include(AttrStyle, fsUnderline);
       if cbStrikeOut.Checked then
         Include(AttrStyle, fsStrikeOut);
       Attr.Style := AttrStyle;
       UnCalckSynh.Attribute[lbElement.ItemIndex].Assign(Attr);
    finally
      Attr.Free;
    end;
    }
end;

procedure TfEnvOptions.cbStrikeOutClick(Sender: TObject);
begin
{
var
  Attr: TmwHighLightAttributes;
  AttrStyle: TFontStyles;
begin
    Attr := TmwHighLightAttributes.Create(lbElement.Items[lbElement.ItemIndex]);
    try
       AttrStyle := [];
       Attr.Foreground := ColorGrid.ForegroundColor;
       Attr.Background := ColorGrid.BackgroundColor;
       if cbBold.Checked then
         Include(AttrStyle, fsBold);
       if cbItalic.Checked then
         Include(AttrStyle, fsItalic);
       if cbUnderLine.Checked then
         Include(AttrStyle, fsUnderline);
       if cbStrikeOut.Checked then
         Include(AttrStyle, fsStrikeOut);
       Attr.Style := AttrStyle;
       UnCalckSynh.Attribute[lbElement.ItemIndex].Assign(Attr);
    finally
      Attr.Free;
    end;
    }
end;

procedure TfEnvOptions.FormCreate(Sender: TObject);
var IniFile: TIniFile;
    TempStr: string;
begin
 IniFile:=TIniFile.Create('UnCalckLang.lan');
 try
  self.Font.Name:=UnConstants.DefaultFontName;
  self.Font.Charset:=UnConstants.DefaultCharSet;
  TempStr:=DeconvertString(IniFile.ReadString(SectionName, SectionName, ''));
  //TempStr:=DeconvertString(IniFile.ReadString(Self.Name, Self.Name, ''));
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
  //CheckLanguige(FNextStep, IniFile, Self);
 finally
  IniFile.Free;
 end;
end;

end.
