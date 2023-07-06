object fDialog: TfDialog
  Left = 370
  Top = 107
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
  ClientHeight = 211
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lMessage: TLabel
    Left = 12
    Top = 10
    Width = 453
    Height = 16
    Constraints.MinWidth = 453
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 164
    Width = 100
    Height = 31
    Caption = #1043#1086#1090#1086#1074#1086
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 260
    Top = 164
    Width = 100
    Height = 31
    Caption = #1054#1090#1082#1072#1079
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn3: TBitBtn
    Left = 368
    Top = 164
    Width = 100
    Height = 31
    Caption = '&'#1055#1086#1084#1086#1097#1100
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn3Click
  end
end
