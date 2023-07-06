object fEnvOptions: TfEnvOptions
  Left = 543
  Top = 124
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1088#1077#1076#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 235
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 204
    Top = 210
    Width = 100
    Height = 33
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 316
    Top = 210
    Width = 100
    Height = 33
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 4
    Width = 425
    Height = 201
    ActivePage = TabSheet1
    TabOrder = 2
    object tsEditor: TTabSheet
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 401
        Height = 89
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1088#1077#1076#1072#1082#1090#1086#1088#1072
        TabOrder = 0
        object cbAutoIndent: TCheckBox
          Left = 8
          Top = 16
          Width = 129
          Height = 17
          Caption = #1040#1074#1090#1086' '#1086#1090#1089#1090#1091#1087
          TabOrder = 0
        end
        object cbDragDropEditing: TCheckBox
          Left = 8
          Top = 32
          Width = 129
          Height = 17
          Caption = 'Drag && Drop '
          TabOrder = 1
        end
        object cbDropFiles: TCheckBox
          Left = 8
          Top = 48
          Width = 129
          Height = 17
          Caption = 'Allow Drop Files'
          TabOrder = 2
        end
        object cbHalfPageScroll: TCheckBox
          Left = 8
          Top = 64
          Width = 197
          Height = 17
          Caption = #1055#1088#1086#1083#1080#1089#1090#1099#1074#1072#1090#1100' '#1087#1086' '#1087#1086#1083' '#1089#1090#1088#1072#1085#1080#1094#1099
          TabOrder = 3
        end
        object cbScrollPastEol: TCheckBox
          Left = 204
          Top = 16
          Width = 137
          Height = 17
          Caption = #1055#1086#1080#1089#1090#1099#1074#1072#1090#1100' '#1074' '#1082#1086#1085#1077#1094' '#1087#1088#1086#1096#1083#1086#1081' '#1089#1090#1088#1086#1082#1080
          TabOrder = 4
        end
        object cbTabsToSpaces: TCheckBox
          Left = 204
          Top = 32
          Width = 193
          Height = 17
          Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1099#1074#1072#1090#1100' TAB '#1074' '#1087#1088#1086#1073#1077#1083
          TabOrder = 5
        end
        object cbSmartTabs: TCheckBox
          Left = 204
          Top = 48
          Width = 173
          Height = 17
          Caption = #1055#1086#1076#1089#1090#1088#1072#1080#1074#1072#1102#1097#1080#1081#1089#1103' TAB'
          TabOrder = 6
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 104
        Width = 401
        Height = 57
        Caption = #1054#1087#1094#1080#1080' '#1084#1072#1088#1082#1077#1088#1072
        TabOrder = 1
        object Label3: TLabel
          Left = 281
          Top = 20
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = #1064#1080#1088#1080#1085#1072
          FocusControl = cbxGutterSize
        end
        object cbGutterVisible: TCheckBox
          Left = 8
          Top = 16
          Width = 121
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100
          TabOrder = 0
        end
        object cbxGutterSize: TComboBox
          Left = 328
          Top = 16
          Width = 65
          Height = 21
          TabOrder = 1
          Text = '30'
          Items.Strings = (
            '30')
        end
        object cbShowLineNumbers: TCheckBox
          Left = 8
          Top = 32
          Width = 121
          Height = 17
          Caption = #1053#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1089#1090#1088#1086#1082#1080
          TabOrder = 2
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1062#1074#1077#1090#1072
      ImageIndex = 1
      object Label2: TLabel
        Left = 24
        Top = 8
        Width = 44
        Height = 13
        Caption = #1069#1083#1077#1084#1077#1085#1090
        FocusControl = lbElement
      end
      object GroupBox1: TGroupBox
        Left = 184
        Top = 20
        Width = 225
        Height = 141
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        TabOrder = 0
        object ColorGrid: TColorGrid
          Left = 8
          Top = 16
          Width = 100
          Height = 100
          TabOrder = 0
          OnChange = ColorGridChange
        end
        object cbBold: TCheckBox
          Left = 120
          Top = 16
          Width = 97
          Height = 17
          Caption = #1046#1080#1088#1085#1086
          TabOrder = 1
          OnClick = cbBoldClick
        end
        object cbItalic: TCheckBox
          Left = 120
          Top = 32
          Width = 97
          Height = 17
          Caption = #1053#1072#1082#1083#1086#1085
          TabOrder = 2
          OnClick = cbItalicClick
        end
        object cbUnderline: TCheckBox
          Left = 120
          Top = 48
          Width = 97
          Height = 17
          Caption = #1055#1086#1076#1095#1077#1088#1082#1080#1074#1072#1085#1080#1077
          TabOrder = 3
          OnClick = cbUnderlineClick
        end
        object cbStrikeOut: TCheckBox
          Left = 120
          Top = 64
          Width = 97
          Height = 17
          Caption = #1055#1077#1088#1077#1095#1077#1088#1082#1085#1091#1090#1086
          TabOrder = 4
          OnClick = cbStrikeOutClick
        end
      end
      object lbElement: TListBox
        Left = 12
        Top = 24
        Width = 165
        Height = 137
        ItemHeight = 13
        TabOrder = 1
        OnClick = lbElementClick
      end
    end
  end
end
