object frmFind: TfrmFind
  Left = 659
  Top = 117
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 145
  ClientWidth = 392
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
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 43
    Height = 13
    Caption = #1048#1089#1082#1072#1090#1100' :'
    FocusControl = cbFindText
  end
  object cbFindText: TComboBox
    Left = 72
    Top = 8
    Width = 237
    Height = 21
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 32
    Width = 157
    Height = 57
    Caption = #1054#1087#1094#1080#1080
    TabOrder = 1
    object cbMatchCase: TCheckBox
      Left = 8
      Top = 16
      Width = 141
      Height = 17
      Caption = #1056#1072#1079#1083#1080#1095#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
      TabOrder = 0
    end
    object cbWholeWord: TCheckBox
      Left = 8
      Top = 32
      Width = 117
      Height = 17
      Caption = #1057#1083#1086#1074#1086' '#1094#1077#1083#1080#1082#1086#1084
      TabOrder = 1
    end
  end
  object btnFind: TButton
    Left = 316
    Top = 4
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btnFindClick
  end
  object btnCancel: TButton
    Left = 316
    Top = 36
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 2
    TabOrder = 3
  end
  object GroupBox2: TGroupBox
    Left = 176
    Top = 32
    Width = 121
    Height = 57
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 4
    object rbForward: TRadioButton
      Left = 8
      Top = 16
      Width = 105
      Height = 17
      Caption = #1042#1087#1077#1088#1077#1076
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbBackward: TRadioButton
      Left = 8
      Top = 32
      Width = 105
      Height = 17
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 96
    Width = 157
    Height = 57
    Caption = #1054#1073#1083#1072#1089#1090#1100
    TabOrder = 5
    object rbGlobal: TRadioButton
      Left = 8
      Top = 16
      Width = 105
      Height = 17
      Caption = #1043#1083#1086#1073#1072#1083#1100#1085#1086
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbSelectedOnly: TRadioButton
      Left = 8
      Top = 32
      Width = 105
      Height = 17
      Caption = #1042' '#1042#1099#1076#1077#1083#1077#1085#1080#1080
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 176
    Top = 96
    Width = 121
    Height = 57
    Caption = #1053#1072#1095#1080#1085#1072#1090#1100
    TabOrder = 6
    object rbFromCursor: TRadioButton
      Left = 8
      Top = 16
      Width = 105
      Height = 17
      Caption = #1054#1090' '#1082#1091#1088#1089#1086#1088#1072
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbEntireScope: TRadioButton
      Left = 8
      Top = 32
      Width = 105
      Height = 17
      Caption = #1057#1085#1072#1095#1072#1083#1072
      TabOrder = 1
    end
  end
end
