unit UnCalckEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCalck, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, ActnList, Spin,
  UnCalckSync, Printers, ImgList, inifiles, UnUDBFunctions,
  EnvironmentOptionsForm, unCalckConstants, findForm, mwHighlighter,
  mwCustomEdit, UnConstants, XPMenu;

type

  TunCalckEditor = class;

  TInsertFromRef = procedure (Sender: TUnCalckEditor; Editor: TmwCustomEdit) of Object;


  TfCalckEditor = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ActionList1: TActionList;
    FontDialog1: TFontDialog;
    aOpen: TAction;
    aSave: TAction;
    aCut: TAction;
    aCopy: TAction;
    aPaste: TAction;
    aSelectAll: TAction;
    aUndo: TAction;
    aFont: TAction;
    aHelp: TAction;
    PopupMenu1: TPopupMenu;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    ScrollBox1: TScrollBox;
    Panel7: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbListFunction: TComboBox;
    mHintFunction: TMemo;
    mHintParams: TMemo;
    BitBtnAdd: TBitBtn;
    Label5: TLabel;
    cbExtListFunction: TComboBox;
    BitBtn4: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    aFind: TAction;
    aFindNext: TAction;
    aPrint: TAction;
    PrintDialog: TPrintDialog;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    ilNormal: TImageList;
    aBookmark: TAction;
    UnCalckSynh1: TUnCalckSynh;
    N31: TMenuItem;
    aEnvOptions: TAction;
    mEditProgramm: TmwCustomEdit;
    Label8: TLabel;
    StaticText1: TStaticText;
    Label4: TLabel;
    cbIncludeVariable: TComboBox;
    mHintVariable: TMemo;
    BitBtn7: TBitBtn;
    XPMenu1: TXPMenu;
    procedure cbListFunctionChange(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure aCutExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure aPasteExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aUndoExecute(Sender: TObject);
    procedure aFontExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbExtListFunctionChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure UnCalckSynh1GetFuncName(var FuncName: String);
    procedure UnCalckSynh1SechFunctionName(const Val: String;
      var IsKeyName: Boolean);
    procedure aCutUpdate(Sender: TObject);
    procedure aPasteUpdate(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aFindNextExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aUndoUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aEnvOptionsExecute(Sender: TObject);
    procedure mEditProgrammChange(Sender: TObject);
    procedure mEditProgrammKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mEditProgrammMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbIncludeVariableChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
   FCalculator: TunCalck;
   FHelpId: Integer;
   SearchOptions: TmwSearchOptions;
   FNextStep: Integer;
   frmEnvOpts: TfEnvOptions;
   frmFind: TfrmFind;
   isShowOne: boolean;
   procedure StoreSettings;
   procedure LoadSettings;
   procedure ShowPositions;
  public
    property HelpId: Integer read FHelpId write FHelpId;
    property Calculator: TunCalck read FCalculator write FCalculator;
  end;

  TunCalckEditor = class(TComponent)
   private
    FCalculator: TunCalck;
    FProgramm: TStringList;
    FStep: Integer;
    FHelpId: Integer;
    FOnShowFindData: TInsertFromRef;
    FOnShowTypeRef: TInsertFromRef;
    function GetStrProgramm: string;
    procedure SetStrProgramm(const Value: string);
   protected
    FWindowState: TWindowState;
    FFormStyle: TFormStyle;
    function CreateEditor: TfCalckEditor; virtual;
    procedure DoShowTypeRef(Sender: TObject);
    procedure DoShowFindData(Sender: TObject);
   public
    Editor: TfCalckEditor;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: boolean;
    property Programm: TStringList read FProgramm;
    property StrProgramm: string read GetStrProgramm write SetStrProgramm;
   published
    property Calculator: TunCalck read  FCalculator write FCalculator;
    property Step: Integer read FStep write FStep;
    property Help_Id: Integer read FHelpId write FHelpId;
    property WindowState: TWindowState read FWindowState write FWindowState;
    property FormStyle: TFormStyle read FFormStyle write FFormStyle;
    property OnShowTypeRef: TInsertFromRef read FOnShowTypeRef write FOnShowTypeRef;
    property OnShowFindData: TInsertFromRef read FOnShowFindData write FOnShowFindData;
  end;

    procedure Register;  

const
  SectionName = 'fCalckEditor';

implementation

 uses clipbrd;

{$R *.DFM}

function FormatAttrib(Attrib : TmwHighLightAttributes) : string;
begin
  Result := IntToHex( Attrib.Background, 8 ) + ':' +
            IntToHex( Attrib.Foreground, 8 ) + ':';
  if (fsBold in Attrib.Style) then
    Result := Result + '1:'
  else
    Result := Result + '0:';

  if (fsItalic in Attrib.Style) then
    Result := Result + '1:'
  else
    Result := Result + '0:';

  if (fsUnderline in Attrib.Style) then
    Result := Result + '1:'
  else
    Result := Result + '0:';

  if (fsStrikeOut in Attrib.Style) then
    Result := Result + '1'
  else
    Result := Result + '0';
end;

procedure ParseAttr(Value : string; Attrib : TmwHighLightAttributes);
var
  P : integer;
begin
  P := pos(':', Value );
  if P > 0 then
    Attrib.Background := strtointdef('$' + copy (Value, 1, P-1 ), clWindow);
  delete( Value, 1, P );

  P := pos(':', Value );
  if P > 0 then
    Attrib.Foreground := strtointdef('$' + copy (Value, 1, P-1 ), clWindowText);
  delete( Value, 1, P );

  Attrib.Style := [];
  P := pos(':', Value );
  if P > 0 then
    if (strtointdef('$' + copy (Value, 1, P-1 ), 0)>0) then
      Attrib.Style := Attrib.Style + [fsBold];
  delete( Value, 1, P );

  P := pos(':', Value );
  if P > 0 then
    if (strtointdef('$' + copy (Value, 1, P-1 ), 0)>0) then
      Attrib.Style := Attrib.Style + [fsItalic];
  delete( Value, 1, P );

  P := pos(':', Value );
  if P > 0 then
    if (strtointdef('$' + copy (Value, 1, P-1 ), 0)>0) then
      Attrib.Style := Attrib.Style + [fsUnderline];
  delete( Value, 1, P );

  P := pos(':', Value );
  if P > 0 then
    if (strtointdef('$' + copy (Value, 1, P-1 ), 0)>0) then
      Attrib.Style := Attrib.Style + [fsStrikeOut];
  delete( Value, 1, P );
end;

{ TunCalckEditor }

constructor TunCalckEditor.Create(AOwner: TComponent);
begin
  inherited;
  FWindowState:=wsMaximized;
  FFormStyle:=fsNormal;
  FProgramm:=TStringList.Create;
  FCalculator:=nil;
  FHelpId:=10001;
end;

function TunCalckEditor.CreateEditor: TfCalckEditor;
begin
 Result:=TfCalckEditor.Create(Application);
 Result.BitBtn5.OnClick:=DoShowTypeRef;
 Result.BitBtn6.OnClick:=DoShowFindData;
end;

destructor TunCalckEditor.Destroy;
begin
  inherited;
 FProgramm.Free;
end;

procedure TunCalckEditor.DoShowFindData(Sender: TObject);
begin
 if Assigned(FOnShowFindData) then
  FOnShowFindData(Self, Self.Editor.mEditProgramm);
end;

procedure TunCalckEditor.DoShowTypeRef(Sender: TObject);
begin
 if Assigned(FOnShowTypeRef) then
  FOnShowTypeRef(Self, self.Editor.mEditProgramm);
end;

function TunCalckEditor.Execute: boolean;
var I: Integer;
begin
 Editor:=CreateEditor;
 try
  if Assigned(FCalculator) then
   begin
    Editor.Calculator:=FCalculator;
    Editor.cbListFunction.Clear;
    for I:=0 to FCalculator.Functions.Count-1 do
     begin
      Editor.cbListFunction.Items.Add(FCalculator.Functions.LikeFuncName[I]);
     end;
    Editor.cbListFunction.ItemIndex:=-1;
    Editor.cbListFunction.ItemIndex:=0;
    Editor.cbExtListFunction.Clear;
    for I:=0 to FCalculator.Externals.Count-1 do
     begin
      Editor.cbExtListFunction.Items.Add(FCalculator.Externals.ExternalName[I].LikeName);
     end;
    Editor.cbExtListFunction.ItemIndex:=-1;
    Editor.cbExtListFunction.ItemIndex:=0;
    Editor.cbIncludeVariable.Items.Clear;
    for I:=0 to FCalculator.Variables.Count-1 do
     begin
      Editor.cbIncludeVariable.Items.Add(FCalculator.Variables.Variable[I].ShowName);
     end;
    Editor.cbIncludeVariable.ItemIndex:=-1;
    Editor.cbIncludeVariable.ItemIndex:=0;
   end
  else
   begin
    Editor.ScrollBox1.Visible:=false;
    Editor.Calculator:=nil;
    MessageDlg(STR_6+CLR+STR_7, mtError, [mbOk], 0);
   end;
  Editor.mEditProgramm.Lines.Assign(FProgramm);
  Editor.HelpId:=Self.FHelpId;
  Result:=Editor.ShowModal = mrOk;
  if Result then
   begin
    FProgramm.Assign(Editor.mEditProgramm.Lines);
   end;
 finally
  Editor.Free;
 end;
end;

function TunCalckEditor.GetStrProgramm: string;
begin
 Result:=FProgramm.Text;
end;

procedure TunCalckEditor.SetStrProgramm(const Value: string);
begin
 FProgramm.Text:=Value;
end;

procedure TfCalckEditor.cbListFunctionChange(Sender: TObject);
var I, J: Integer;
begin
 if Self.Visible then
  begin
   mHintFunction.Lines.Clear;
   for I:=0 to  FCalculator.Functions.Count-1 do
    begin
     if cbListFunction.Items[cbListFunction.ItemIndex] =
          FCalculator.Functions.LikeFuncName[I] then
      begin
       mHintFunction.Lines.Text:=
        FCalculator.Functions.FuncHint[I];
       mHintParams.Lines.Clear;
       for J:=0 to FCalculator.Functions.FuncParamCount[I]-1 do
        begin
         mHintParams.Lines.Add(IntToStr(J)+'. '+FCalculator.Functions.FuncParamHint[I, J]);
        end;
       break;
      end;
    end;
  end;
end;

procedure TfCalckEditor.BitBtnAddClick(Sender: TObject);
begin
  Clipboard.AsText:=cbListFunction.Items[cbListFunction.ItemIndex]+'()';
  mEditProgramm.PasteFromClipboard;
  mEditProgramm.CaretX:=mEditProgramm.CaretX-1;
  mEditProgramm.SetFocus;
end;

procedure TfCalckEditor.BitBtn4Click(Sender: TObject);
begin
  Clipboard.AsText:=cbExtListFunction.Items[cbExtListFunction.ItemIndex]+'()';
  mEditProgramm.PasteFromClipboard;
  mEditProgramm.CaretX:=mEditProgramm.CaretX-1;
  mEditProgramm.SetFocus;
end;

procedure TfCalckEditor.N8Click(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

procedure TfCalckEditor.N9Click(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TfCalckEditor.N17Click(Sender: TObject);
begin
 MessageDlg('Universal calculator 4.2.'+CLR+
  'Programmer: Bannikov N. A.'+CLR+
  'Copyright 1986 - 2002', mtInformation, [mbOk], 0);
end;

procedure TfCalckEditor.aHelpExecute(Sender: TObject);
begin
 Application.HelpContext(FHelpId);
end;

procedure TfCalckEditor.aSaveExecute(Sender: TObject);
begin
 if SaveDialog1.Execute then
  begin
   mEditProgramm.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TfCalckEditor.aOpenExecute(Sender: TObject);
begin
 if OpenDialog1.Execute then
  begin
   mEditProgramm.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TfCalckEditor.aCutExecute(Sender: TObject);
begin
 mEditProgramm.CutToClipboard;
end;

procedure TfCalckEditor.aCopyExecute(Sender: TObject);
begin
 mEditProgramm.CopyToClipboard;
end;

procedure TfCalckEditor.aPasteExecute(Sender: TObject);
begin
 mEditProgramm.PasteFromClipboard;
end;

procedure TfCalckEditor.aSelectAllExecute(Sender: TObject);
begin
 mEditProgramm.SelectAll;
end;

procedure TfCalckEditor.aUndoExecute(Sender: TObject);
begin
 mEditProgramm.Undo;
end;

procedure TfCalckEditor.aFontExecute(Sender: TObject);
var FontDialog1: TFontDialog;
begin
 FontDialog1:=TFontDialog.Create(nil);
 try
 FontDialog1.Font.Assign(mEditProgramm.Font);
 if FontDialog1.Execute then
  begin
   mEditProgramm.Font.Assign(FontDialog1.Font);
   StoreSettings;
   mEditProgramm.Invalidate;
  end;
 finally
  FontDialog1.Free;
 end;
end;

procedure TfCalckEditor.FormActivate(Sender: TObject);
begin
 cbListFunction.ItemIndex:=0;
 cbExtListFunction.ItemIndex:=0;
end;

procedure Register;
begin
  RegisterComponents('UnLibrary', [TunCalckEditor]);
end;

procedure TfCalckEditor.cbExtListFunctionChange(Sender: TObject);
var I: Integer;
begin
 if Self.Visible then
  begin
   for I:=0 to FCalculator.Externals.Count-1 do
    begin
     if FCalculator.Externals.ExternalName[I].LikeName =
            cbExtListFunction.Items[cbExtListFunction.ItemIndex] then
      begin
       Label7.Caption:=
        IntToStr(FCalculator.Externals.ExternalName[I].ParamCount);
      end;
    end;
  end;
end;

procedure TfCalckEditor.UnCalckSynh1GetFuncName(var FuncName: String);
var I: Integer;
    IsOk: boolean;
begin
 if Assigned(FCalculator) then
  begin
   IsOk:=false;
   for I:=0 to FCalculator.Functions.Count-1 do
    begin
     if FCalculator.Functions.FuncName[I] = AnsiUpperCase(FuncName) then
      begin
       FuncName:=FCalculator.Functions.LikeFuncName[I];
       IsOk:=true;
       break;
      end;
    end;
  if not IsOk then
   for I:=0 to FCalculator.Externals.Count-1 do
    begin
     if FCalculator.Externals.ExternalName[I].Name = AnsiUpperCase(FuncName) then
      begin
       FuncName:=FCalculator.Externals.ExternalName[I].LikeName;
       IsOk:=true;
       break;
      end;
    end;
   if not IsOk then
    if AnsiUpperCase(FuncName) = 'END' then
     FuncName:='end';
  end;
end;

procedure TfCalckEditor.UnCalckSynh1SechFunctionName(const Val: String;
  var IsKeyName: Boolean);
var I: Integer;
    TempName: string;
begin
 if Assigned(FCalculator) then
  begin
   IsKeyName:=false;
   TempName:=Val;
   for I:=0 to FCalculator.Functions.Count-1 do
    begin
     if FCalculator.Functions.FuncName[I] = AnsiUpperCase(TempName) then
      begin
       IsKeyName:=true;
       break;
      end;
    end;
  if not IsKeyName then
   for I:=0 to FCalculator.Externals.Count-1 do
    begin
     if FCalculator.Externals.ExternalName[I].Name = AnsiUpperCase(TempName) then
      begin
       IsKeyName:=true;
       break;
      end;
    end;
   if not IsKeyName then
    if AnsiUpperCase(TempName) = 'END' then
     IsKeyName:=true;
  end;
end;

procedure TfCalckEditor.aCutUpdate(Sender: TObject);
begin
 aCut.Enabled:=Length(mEditProgramm.SelText) > 0;
 aCopy.Enabled:=aCut.Enabled;
end;

procedure TfCalckEditor.aPasteUpdate(Sender: TObject);
begin
 aPaste.Enabled:=Clipboard.HasFormat(CF_TEXT);
end;

procedure TfCalckEditor.aFindExecute(Sender: TObject);
var
  OldBlockBegin: TPoint;
  OldBlockEnd: TPoint;
begin
  with mEditProgramm do begin
    OldBlockBegin := BlockBegin;
    OldBlockEnd   := BlockEnd;
    SetSelWord;
    frmFind.cbFindText.Text := SelText;
    BlockBegin := OldBlockBegin;
    BlockEnd   := OldBlockEnd;
    if frmFind.ShowModal=mrOk then begin
      SearchOptions := [];
      if frmFind.cbMatchCase.Checked then
        include( SearchOptions, mwsoMatchCase );
      if frmFind.cbWholeWord.Checked then
        include( SearchOptions, mwsoWholeWord );
      if frmFind.rbBackward.Checked then
        include( SearchOptions, mwsoBackwards );
      if frmFind.rbSelectedOnly.Checked then
        include( SearchOptions, mwsoSelectedOnly );
      if frmFind.rbEntireScope.Checked then
        include( SearchOptions, mwsoEntireScope );

      SearchReplace(frmFind.cbFindText.Text, '', SearchOptions );
    end;
  end;
end;

procedure TfCalckEditor.FormCreate(Sender: TObject);
var IniFile: TIniFile;
    TempStr: string;
begin
 isShowOne:=false;
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
  //CheckLanguige(FNextStep, IniFile, Self);
  CheckLanguige(FNextStep, IniFile, Self, SectionName);
 finally
  IniFile.Free;
 end;
 frmFind:=TfrmFind.Create(Self);
 frmEnvOpts:=TfEnvOptions.Create(Self);

 ModifyMenu(MainMenu1.Handle, MainMenu1.Items.IndexOf(N4),
 MF_BYPOSITION or MF_POPUP or MF_HELP,
 N4.Handle, PChar(N4.Caption));
end;

procedure TfCalckEditor.FormDestroy(Sender: TObject);
begin
 frmFind.Free;
 frmEnvOpts.Free;
end;

procedure TfCalckEditor.aFindNextExecute(Sender: TObject);
begin
  exclude( SearchOptions, mwsoEntireScope );
  mEditProgramm.SearchReplace(frmFind.cbFindText.Text, '', SearchOptions );
end;

procedure TfCalckEditor.aPrintExecute(Sender: TObject);
var Options:TmwPrintOptions;
    TextRect: TRect;
    PrinterRect: TRect;
begin
 if PrintDialog.Execute then
  begin
   Options.SelectedOnly:=mEditProgramm.SelText <> '';
   Options.Highlighted:=true;
   Options.WrapLongLines:=true;
   Options.IgnoreColors:=false;
   Options.Copies:=PrintDialog.Copies;
   Options.Title:=STR_8;
   Options.MarginUnits:=muPixels;

   TextRect.Left:=50;
   TextRect.Top:=50;
   TextRect.Right:=Printer.PageHeight-100;
   TextRect.Bottom:=Printer.PageWidth-100;

   PrinterRect.Left:=mEditProgramm.LeftChar;
   PrinterRect.Top:=mEditProgramm.TopLine;
   PrinterRect.Right:=mEditProgramm.MaxLeftChar;
   PrinterRect.Bottom:=mEditProgramm.LineCount;

   Options.Margins:=TextRect;
   Options.PrintRange:=PrinterRect;
   Options.Header:=TStringList.Create;
   try
    Options.Header.Add('');
    Options.Footer:=TStringList.Create;
    try
     Options.Footer.Add('');
     mEditProgramm.Print(mEditProgramm.Font, Options);
    finally
     Options.Footer.Free;
    end;
   finally
    Options.Header.Free;
   end;
  end;
end;

procedure TfCalckEditor.aUndoUpdate(Sender: TObject);
begin
 aUndo.Enabled:=mEditProgramm.CanUndo;
end;

procedure TfCalckEditor.FormShow(Sender: TObject);
var I: Integer;
begin
 if not isShowOne then
  begin
   LoadSettings;
   self.WindowState:=wsMaximized;
   self.SetFocus;
   isShowOne:=true;
   I:=0;
   while I < cbIncludeVariable.Items.Count do
    begin
     if Trim(cbIncludeVariable.Items[I]) = '' then
      cbIncludeVariable.Items.Delete(I)
     else
      I:=I+1;
    end;
  end;
end;

procedure TfCalckEditor.StoreSettings;
var
  INI : TINIFile;
  I,J : integer;
begin
  INI := TIniFile.Create('UnCalck.ini');
  try
    for i := 0 to ComponentCount-1 do
      if Components[i] is TmwCustomHighLighter then
        with Components[i] as TmwCustomHighLighter do
          for J := 0 to AttrCount-1 do
             INI.WriteString( LanguageName, Attribute[J].Name,
               FormatAttrib( Attribute[J] ));
    INI.WriteBool( _EDITOR, 'AutoIndent', frmEnvOpts.cbAutoIndent.Checked );
    INI.WriteBool( _EDITOR, 'DragDropEditing', frmEnvOpts.cbDragDropEditing.Checked );
    INI.WriteBool( _EDITOR, 'DropFiles', frmEnvOpts.cbDropFiles.Checked );
    INI.WriteBool( _EDITOR, 'HalfPageScroll', frmEnvOpts.cbHalfPageScroll.Checked );
    INI.WriteBool( _EDITOR, 'ScrollPastEol', frmEnvOpts.cbScrollPastEol.Checked );
    INI.WriteBool( _EDITOR, 'TabsToSpaces', frmEnvOpts.cbTabsToSpaces.Checked );
    INI.WriteBool( _EDITOR, 'SmartTabs', frmEnvOpts.cbSmartTabs.Checked );
    INI.WriteInteger( _EDITOR, 'Font_Size', mEditProgramm.Font.Size);
    INI.WriteInteger( _EDITOR, 'Font_CharSet', mEditProgramm.Font.Charset);
    INI.WriteString( _EDITOR, 'Font_Name', mEditProgramm.Font.Name);

    INI.WriteBool( 'Gutter', 'ShowLineNumbers', frmEnvOpts.cbShowLineNumbers.Checked );
    INI.WriteString( 'Gutter', 'GutterSize', frmEnvOpts.cbxGutterSize.Text );
  finally
    INI.Free;
  end;
end;

procedure TfCalckEditor.LoadSettings;
var
  INI : TINIFile;
  I,J : integer;
  Attr: string;
begin
  INI := TIniFile.Create('UnCalck.ini');
  try
    for i := 0 to ComponentCount-1 do
      if Components[i] is TmwCustomHighLighter then
        with Components[i] as TmwCustomHighLighter do
          for J := 0 to AttrCount-1 do begin
             Attr := INI.ReadString( LanguageName, Attribute[J].Name,
               FormatAttrib( Attribute[J] ));
             ParseAttr( Attr, Attribute[J] );
          end;
    frmEnvOpts.cbAutoIndent.Checked := INI.ReadBool( _EDITOR, 'AutoIndent', true );
    frmEnvOpts.cbDragDropEditing.Checked := INI.ReadBool( _EDITOR, 'DragDropEditing', true );
    frmEnvOpts.cbDropFiles.Checked := INI.ReadBool( _EDITOR, 'DropFiles', false );
    frmEnvOpts.cbHalfPageScroll.Checked := INI.ReadBool( _EDITOR, 'HalfPageScroll', false );
    frmEnvOpts.cbScrollPastEol.Checked := INI.ReadBool( _EDITOR, 'ScrollPastEol', true );
    frmEnvOpts.cbTabsToSpaces.Checked := INI.ReadBool( _EDITOR, 'TabsToSpaces', true );
    frmEnvOpts.cbSmartTabs.Checked := INI.ReadBool( _EDITOR, 'SmartTabs', true );
    mEditProgramm.Font.Size:=INI.ReadInteger( _EDITOR, 'Font_Size', 10);
    mEditProgramm.Font.Charset:=INI.ReadInteger( _EDITOR, 'Font_CharSet', 1);
    mEditProgramm.Font.Name:=INI.ReadString( _EDITOR, 'Font_Name', 'Courier New');

    frmEnvOpts.cbShowLineNumbers.Checked := INI.ReadBool( 'Gutter', 'ShowLineNumbers', false );
    frmEnvOpts.cbxGutterSize.Text := INI.ReadString( 'Gutter', 'GutterSize', '30' );
    frmEnvOpts.cbGutterVisible.Checked := boolean(strtoint(frmEnvOpts.cbxGutterSize.Text));
  finally
    INI.Free;
  end;
end;

procedure TfCalckEditor.aEnvOptionsExecute(Sender: TObject);
var fEnvOptions: TfEnvOptions;
begin
 fEnvOptions:=TfEnvOptions.Create(Self);
 try
  fEnvOptions.UnCalckSynh:=UnCalckSynh1;
  fEnvOptions.Editor:=mEditProgramm;
  if fEnvOptions.ShowModal = mrOk then
   begin
    StoreSettings;
    mEditProgramm.Invalidate;
   end;
 finally
  fEnvOptions.Free;
 end;
end;

procedure TfCalckEditor.ShowPositions;
begin
 StaticText1.Caption:=STR_4+IntToStr(mEditProgramm.CaretY)+'  '+STR_5+IntToStr(mEditProgramm.CaretX);
end;

procedure TfCalckEditor.mEditProgrammChange(Sender: TObject);
begin
 ShowPositions;
end;

procedure TfCalckEditor.mEditProgrammKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 ShowPositions;
end;

procedure TfCalckEditor.mEditProgrammMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ShowPositions;
end;

procedure TfCalckEditor.cbIncludeVariableChange(Sender: TObject);
begin
 if Self.Visible then
  begin
   mHintVariable.Lines.Clear;
   mHintVariable.Lines.Text:=FCalculator.Variables.Variable[cbIncludeVariable.ItemIndex].Caption;
  end;
end;

procedure TfCalckEditor.BitBtn7Click(Sender: TObject);
begin
  Clipboard.AsText:=cbIncludeVariable.Items[cbIncludeVariable.ItemIndex];
  mEditProgramm.PasteFromClipboard;
  mEditProgramm.SetFocus;
end;

end.
