object fCalckEditor: TfCalckEditor
  Left = 282
  Top = 96
  Width = 620
  Height = 640
  BorderWidth = 2
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 318
    Top = 0
    Width = 290
    Height = 550
    Align = alRight
    BorderStyle = bsNone
    TabOrder = 0
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 290
      Height = 550
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 0
        Width = 172
        Height = 13
        Caption = #1057#1087#1080#1089#1086#1082' '#1074#1089#1090#1088#1086#1077#1085#1085#1099#1093' '#1092#1091#1085#1082#1094#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 7
        Top = 40
        Width = 66
        Height = 13
        Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 121
        Width = 119
        Height = 13
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 6
        Top = 243
        Width = 152
        Height = 13
        Caption = #1057#1087#1080#1089#1086#1082' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1091#1085#1082#1094#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 14
        Top = 291
        Width = 149
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'  '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 176
        Top = 289
        Width = 81
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 14
        Top = 351
        Width = 151
        Height = 13
        Caption = #1042#1089#1090#1088#1086#1077#1085#1085#1099#1077' '#1087#1077#1088#1077#1084#1077#1085#1085#1099#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbListFunction: TComboBox
        Left = 16
        Top = 16
        Width = 248
        Height = 21
        Style = csDropDownList
        DropDownCount = 25
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnChange = cbListFunctionChange
      end
      object mHintFunction: TMemo
        Left = 20
        Top = 58
        Width = 247
        Height = 59
        TabStop = False
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 5
      end
      object mHintParams: TMemo
        Left = 20
        Top = 141
        Width = 247
        Height = 59
        TabStop = False
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object BitBtnAdd: TBitBtn
        Left = 26
        Top = 209
        Width = 218
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
        TabOrder = 1
        OnClick = BitBtnAddClick
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
      end
      object cbExtListFunction: TComboBox
        Left = 16
        Top = 260
        Width = 248
        Height = 21
        Style = csDropDownList
        DropDownCount = 25
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
        OnChange = cbExtListFunctionChange
      end
      object BitBtn4: TBitBtn
        Left = 26
        Top = 317
        Width = 218
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
        TabOrder = 3
        OnClick = BitBtn4Click
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
      end
      object BitBtn5: TBitBtn
        Left = 26
        Top = 495
        Width = 218
        Height = 25
        Caption = #1042#1099#1079#1074#1072#1090#1100' '#1076#1080#1079#1072#1081#1085#1077#1088' '#1090#1080#1087#1086#1074
        TabOrder = 4
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
      end
      object BitBtn6: TBitBtn
        Left = 26
        Top = 525
        Width = 218
        Height = 25
        Caption = #1042#1099#1079#1074#1072#1090#1100' '#1075#1083#1072#1074#1085#1086#1077' '#1086#1082#1085#1086
        TabOrder = 7
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
      end
      object cbIncludeVariable: TComboBox
        Left = 16
        Top = 370
        Width = 248
        Height = 21
        Style = csDropDownList
        DropDownCount = 25
        ItemHeight = 13
        TabOrder = 8
        OnChange = cbIncludeVariableChange
      end
      object mHintVariable: TMemo
        Left = 20
        Top = 392
        Width = 247
        Height = 55
        TabStop = False
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 9
      end
      object BitBtn7: TBitBtn
        Left = 26
        Top = 449
        Width = 218
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
        TabOrder = 10
        OnClick = BitBtn7Click
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 550
    Align = alClient
    TabOrder = 1
    object mEditProgramm: TmwCustomEdit
      Left = 1
      Top = 1
      Width = 316
      Height = 548
      Cursor = crIBeam
      Align = alClient
      ParentColor = False
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      Gutter.AutoSize = True
      Gutter.Color = clSilver
      Gutter.DigitCount = 2
      Gutter.LeftOffset = 10
      Gutter.RightOffset = 5
      Gutter.ShowLineNumbers = True
      Gutter.UseFontStyle = True
      HighLighter = UnCalckSynh1
      Keystrokes = <
        item
          ShortCut = 38
          ShortCut2 = 0
          Command = ecUp
        end
        item
          ShortCut = 8230
          ShortCut2 = 0
          Command = ecSelUp
        end
        item
          ShortCut = 16422
          ShortCut2 = 0
          Command = ecScrollUp
        end
        item
          ShortCut = 40
          ShortCut2 = 0
          Command = ecDown
        end
        item
          ShortCut = 8232
          ShortCut2 = 0
          Command = ecSelDown
        end
        item
          ShortCut = 16424
          ShortCut2 = 0
          Command = ecScrollDown
        end
        item
          ShortCut = 37
          ShortCut2 = 0
          Command = ecLeft
        end
        item
          ShortCut = 8229
          ShortCut2 = 0
          Command = ecSelLeft
        end
        item
          ShortCut = 16421
          ShortCut2 = 0
          Command = ecWordLeft
        end
        item
          ShortCut = 24613
          ShortCut2 = 0
          Command = ecSelWordLeft
        end
        item
          ShortCut = 39
          ShortCut2 = 0
          Command = ecRight
        end
        item
          ShortCut = 8231
          ShortCut2 = 0
          Command = ecSelRight
        end
        item
          ShortCut = 16423
          ShortCut2 = 0
          Command = ecWordRight
        end
        item
          ShortCut = 24615
          ShortCut2 = 0
          Command = ecSelWordRight
        end
        item
          ShortCut = 34
          ShortCut2 = 0
          Command = ecPageDown
        end
        item
          ShortCut = 8226
          ShortCut2 = 0
          Command = ecSelPageDown
        end
        item
          ShortCut = 16418
          ShortCut2 = 0
          Command = ecPageBottom
        end
        item
          ShortCut = 24610
          ShortCut2 = 0
          Command = ecSelPageBottom
        end
        item
          ShortCut = 33
          ShortCut2 = 0
          Command = ecPageUp
        end
        item
          ShortCut = 8225
          ShortCut2 = 0
          Command = ecSelPageUp
        end
        item
          ShortCut = 16417
          ShortCut2 = 0
          Command = ecPageTop
        end
        item
          ShortCut = 24609
          ShortCut2 = 0
          Command = ecSelPageTop
        end
        item
          ShortCut = 36
          ShortCut2 = 0
          Command = ecLineStart
        end
        item
          ShortCut = 8228
          ShortCut2 = 0
          Command = ecSelLineStart
        end
        item
          ShortCut = 16420
          ShortCut2 = 0
          Command = ecEditorTop
        end
        item
          ShortCut = 24612
          ShortCut2 = 0
          Command = ecSelEditorTop
        end
        item
          ShortCut = 35
          ShortCut2 = 0
          Command = ecLineEnd
        end
        item
          ShortCut = 8227
          ShortCut2 = 0
          Command = ecSelLineEnd
        end
        item
          ShortCut = 16419
          ShortCut2 = 0
          Command = ecEditorBottom
        end
        item
          ShortCut = 24611
          ShortCut2 = 0
          Command = ecSelEditorBottom
        end
        item
          ShortCut = 45
          ShortCut2 = 0
          Command = ecToggleMode
        end
        item
          ShortCut = 16429
          ShortCut2 = 0
          Command = ecCopy
        end
        item
          ShortCut = 8238
          ShortCut2 = 0
          Command = ecCut
        end
        item
          ShortCut = 8237
          ShortCut2 = 0
          Command = ecPaste
        end
        item
          ShortCut = 46
          ShortCut2 = 0
          Command = ecDeleteChar
        end
        item
          ShortCut = 8
          ShortCut2 = 0
          Command = ecDeleteLastChar
        end
        item
          ShortCut = 8200
          ShortCut2 = 0
          Command = ecDeleteLastChar
        end
        item
          ShortCut = 16392
          ShortCut2 = 0
          Command = ecDeleteLastWord
        end
        item
          ShortCut = 32776
          ShortCut2 = 0
          Command = ecUndo
        end
        item
          ShortCut = 40968
          ShortCut2 = 0
          Command = ecRedo
        end
        item
          ShortCut = 13
          ShortCut2 = 0
          Command = ecLineBreak
        end
        item
          ShortCut = 8205
          ShortCut2 = 0
          Command = ecLineBreak
        end
        item
          ShortCut = 9
          ShortCut2 = 0
          Command = ecTab
        end
        item
          ShortCut = 8201
          ShortCut2 = 0
          Command = ecShiftTab
        end
        item
          ShortCut = 16496
          ShortCut2 = 0
          Command = ecNone
        end
        item
          ShortCut = 16449
          ShortCut2 = 0
          Command = ecSelectAll
        end
        item
          ShortCut = 16451
          ShortCut2 = 0
          Command = ecCopy
        end
        item
          ShortCut = 16470
          ShortCut2 = 0
          Command = ecPaste
        end
        item
          ShortCut = 16472
          ShortCut2 = 0
          Command = ecCut
        end
        item
          ShortCut = 24649
          ShortCut2 = 0
          Command = ecBlockIndent
        end
        item
          ShortCut = 24661
          ShortCut2 = 0
          Command = ecBlockUnindent
        end
        item
          ShortCut = 16461
          ShortCut2 = 0
          Command = ecLineBreak
        end
        item
          ShortCut = 16462
          ShortCut2 = 0
          Command = ecInsertLine
        end
        item
          ShortCut = 16468
          ShortCut2 = 0
          Command = ecDeleteWord
        end
        item
          ShortCut = 16473
          ShortCut2 = 0
          Command = ecDeleteLine
        end
        item
          ShortCut = 24665
          ShortCut2 = 0
          Command = ecDeleteEOL
        end
        item
          ShortCut = 16474
          ShortCut2 = 0
          Command = ecUndo
        end
        item
          ShortCut = 24666
          ShortCut2 = 0
          Command = ecRedo
        end
        item
          ShortCut = 16432
          ShortCut2 = 0
          Command = ecGotoMarker0
        end
        item
          ShortCut = 16433
          ShortCut2 = 0
          Command = ecGotoMarker1
        end
        item
          ShortCut = 16434
          ShortCut2 = 0
          Command = ecGotoMarker2
        end
        item
          ShortCut = 16435
          ShortCut2 = 0
          Command = ecGotoMarker3
        end
        item
          ShortCut = 16436
          ShortCut2 = 0
          Command = ecGotoMarker4
        end
        item
          ShortCut = 16437
          ShortCut2 = 0
          Command = ecGotoMarker5
        end
        item
          ShortCut = 16438
          ShortCut2 = 0
          Command = ecGotoMarker6
        end
        item
          ShortCut = 16439
          ShortCut2 = 0
          Command = ecGotoMarker7
        end
        item
          ShortCut = 16440
          ShortCut2 = 0
          Command = ecGotoMarker8
        end
        item
          ShortCut = 16441
          ShortCut2 = 0
          Command = ecGotoMarker9
        end
        item
          ShortCut = 24624
          ShortCut2 = 0
          Command = ecSetMarker0
        end
        item
          ShortCut = 24625
          ShortCut2 = 0
          Command = ecSetMarker1
        end
        item
          ShortCut = 24626
          ShortCut2 = 0
          Command = ecSetMarker2
        end
        item
          ShortCut = 24627
          ShortCut2 = 0
          Command = ecSetMarker3
        end
        item
          ShortCut = 24628
          ShortCut2 = 0
          Command = ecSetMarker4
        end
        item
          ShortCut = 24629
          ShortCut2 = 0
          Command = ecSetMarker5
        end
        item
          ShortCut = 24630
          ShortCut2 = 0
          Command = ecSetMarker6
        end
        item
          ShortCut = 24631
          ShortCut2 = 0
          Command = ecSetMarker7
        end
        item
          ShortCut = 24632
          ShortCut2 = 0
          Command = ecSetMarker8
        end
        item
          ShortCut = 24633
          ShortCut2 = 0
          Command = ecSetMarker9
        end
        item
          ShortCut = 24654
          ShortCut2 = 0
          Command = ecNormalSelect
        end
        item
          ShortCut = 24643
          ShortCut2 = 0
          Command = ecColumnSelect
        end
        item
          ShortCut = 24652
          ShortCut2 = 0
          Command = ecLineSelect
        end
        item
          ShortCut = 24642
          ShortCut2 = 0
          Command = ecMatchBracket
        end>
      Lines.Strings = (
        '')
      MaxUndo = 10
      ReadOnly = False
      WantTabs = False
      OnKeyUp = mEditProgrammKeyUp
      OnMouseUp = mEditProgrammMouseUp
      OnChange = mEditProgrammChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 550
    Width = 608
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label8: TLabel
      Left = 4
      Top = 14
      Width = 115
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1079#1080#1094#1080#1103' '#1074' '#1090#1077#1082#1089#1090#1077' : '
    end
    object Panel4: TPanel
      Left = 280
      Top = 0
      Width = 328
      Height = 40
      Align = alRight
      BevelOuter = bvNone
      BorderWidth = 3
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 7
        Top = 6
        Width = 100
        Height = 28
        Caption = #1043#1086#1090#1086#1074#1086
        ModalResult = 1
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 114
        Top = 6
        Width = 100
        Height = 28
        Caption = #1054#1090#1082#1072#1079
        TabOrder = 1
        Kind = bkCancel
      end
      object BitBtn3: TBitBtn
        Left = 221
        Top = 6
        Width = 100
        Height = 28
        Action = aHelp
        Caption = #1057#1087#1088#1072#1074#1082#1072
        TabOrder = 2
        Kind = bkHelp
      end
    end
    object StaticText1: TStaticText
      Left = 122
      Top = 12
      Width = 151
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = ' '
      TabOrder = 1
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt|'#1042#1089#1077'|*.*'
    Title = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Left = 115
    Top = 143
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt|'#1042#1089#1077'|*.*'
    Title = #1054#1090#1082#1088#1099#1090#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Left = 39
    Top = 145
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Options = [fdEffects, fdNoStyleSel]
    Left = 183
    Top = 145
  end
  object PrintDialog: TPrintDialog
    Left = 256
    Top = 146
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 218
    Top = 86
    object N19: TMenuItem
      Action = aCut
    end
    object N24: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Action = aCopy
    end
    object N21: TMenuItem
      Action = aPaste
    end
    object N25: TMenuItem
      Caption = '-'
    end
    object N22: TMenuItem
      Action = aSelectAll
    end
    object N26: TMenuItem
      Caption = '-'
    end
    object N23: TMenuItem
      Action = aUndo
    end
  end
  object ActionList1: TActionList
    Images = ilNormal
    Left = 159
    Top = 81
    object aOpen: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      ImageIndex = 0
      ShortCut = 16506
      OnExecute = aOpenExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      ImageIndex = 2
      ShortCut = 16467
      OnExecute = aSaveExecute
    end
    object aCut: TAction
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      ImageIndex = 10
      ShortCut = 16472
      OnExecute = aCutExecute
      OnUpdate = aCutUpdate
    end
    object aCopy: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 1
      ShortCut = 16451
      OnExecute = aCopyExecute
      OnUpdate = aCutUpdate
    end
    object aPaste: TAction
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 16470
      OnExecute = aPasteExecute
      OnUpdate = aPasteUpdate
    end
    object aSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnExecute = aSelectAllExecute
    end
    object aUndo: TAction
      Caption = #1054#1090#1082#1072#1090
      ShortCut = 16474
      OnExecute = aUndoExecute
      OnUpdate = aUndoUpdate
    end
    object aFont: TAction
      Caption = #1064#1088#1080#1092#1090
      ImageIndex = 9
      OnExecute = aFontExecute
    end
    object aHelp: TAction
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 13
      ShortCut = 112
      OnExecute = aHelpExecute
    end
    object aFind: TAction
      Caption = #1053#1072#1081#1090#1080
      ImageIndex = 16
      ShortCut = 16454
      OnExecute = aFindExecute
    end
    object aFindNext: TAction
      Caption = #1048#1089#1082#1072#1090#1100' '#1076#1072#1083#1100#1096#1077
      ShortCut = 114
      OnExecute = aFindNextExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 4
      OnExecute = aPrintExecute
    end
    object aBookmark: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
      ImageIndex = 12
    end
    object aEnvOptions: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1088#1077#1076#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1103
      ImageIndex = 12
      OnExecute = aEnvOptionsExecute
    end
  end
  object MainMenu1: TMainMenu
    Images = ilNormal
    OwnerDraw = True
    Left = 87
    Top = 79
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Action = aOpen
      end
      object N6: TMenuItem
        Action = aSave
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object N28: TMenuItem
        Action = aFind
      end
      object N29: TMenuItem
        Action = aFindNext
      end
      object N30: TMenuItem
        Action = aPrint
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #1043#1086#1090#1086#1074#1086
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1054#1090#1082#1072#1079
        OnClick = N9Click
      end
    end
    object N2: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088
      object N10: TMenuItem
        Action = aCut
      end
      object N11: TMenuItem
        Action = aCopy
      end
      object N12: TMenuItem
        Action = aPaste
      end
      object N18: TMenuItem
        Action = aSelectAll
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Action = aUndo
      end
    end
    object N3: TMenuItem
      Caption = #1042#1080#1076
      object N15: TMenuItem
        Action = aFont
      end
      object N31: TMenuItem
        Action = aEnvOptions
      end
    end
    object N4: TMenuItem
      Caption = #1055#1086#1084#1086#1096#1100
      object N16: TMenuItem
        Action = aHelp
      end
      object N17: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N17Click
      end
    end
  end
  object UnCalckSynh1: TUnCalckSynh
    DefaultFilter = 'UnCalckFiles(*.clk)|*.clk'
    AsmAttri.Background = clBlack
    AsmAttri.Foreground = clWhite
    CommentAttri.Background = clWhite
    CommentAttri.Foreground = clGrayText
    CommentAttri.Style = [fsItalic]
    DirecAttri.Background = clWhite
    DirecAttri.Foreground = clBlack
    IdentifierAttri.Background = clWhite
    IdentifierAttri.Foreground = clBlack
    InvalidAttri.Background = clWhite
    InvalidAttri.Foreground = clRed
    KeyAttri.Background = clWhite
    KeyAttri.Foreground = clBlack
    KeyAttri.Style = [fsBold]
    NumberAttri.Background = clWhite
    NumberAttri.Foreground = clGreen
    SpaceAttri.Background = clWhite
    SpaceAttri.Foreground = clBlack
    StringAttri.Background = clWhite
    StringAttri.Foreground = clNavy
    SymbolAttri.Background = clWhite
    SymbolAttri.Foreground = clBlue
    OnSechFunctionName = UnCalckSynh1SechFunctionName
    OnGetFuncName = UnCalckSynh1GetFuncName
    Left = 156
    Top = 28
  end
  object ilNormal: TImageList
    Left = 216
    Top = 212
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484000000000000FFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400848484008484840084848400000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400FFFFFF00C6C6
      C600FFFFFF000000FF00FFFFFF00C6C6C600FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00C6C6C6000000FF00C6C6C600FFFFFF00C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      FF000000FF000000FF000000FF000000FF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00C6C6C6000000FF00C6C6C600FFFFFF00C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400FFFFFF00C6C6
      C600FFFFFF000000FF00FFFFFF00C6C6C600FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001800180021002100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001000100063006300BD9CBD004A214A00210021000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001000100063006300AD84AD00F7FFF700FFFFFF00D6DED6004A184A002100
      2100000000000000000000000000000000000000000000000000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF00000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6008484840000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000100010006300
      6300AD84AD00F7FFF700FFFFFF00FFFFFF00C6CEC600CECECE00DEE7DE004A18
      4A002100210000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      000000000000000000007B7B7B0000000000000000000000000000000000FFFF
      FF000000000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD0000FFFF0000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000004A004A0063006300AD84AD00F7FF
      F700FFFFFF00FFFFFF00BDC6BD0018311800290029006B846B00D6D6D600DEE7
      DE004A184A00210021000000000000000000000000007B7B7B0000000000BDBD
      BD007B7B7B000000000000000000BDBDBD00BDBDBD00000000007B7B7B00BDBD
      BD0000000000000000007B7B7B000000000000000000000000000000000000FF
      FF00FFFFFF000000000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000000000000000000031003100FFFFFF00FFFFFF00FFFF
      FF00BDC6BD0018311800310021009C009400940094005A005A006B846B00D6D6
      D600DEE7DE004A184A00210021000000000000000000000000007B7B7B00BDBD
      BD007B7B7B00BDBDBD00BDBDBD007B7B7B0000000000BDBDBD007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848484000000
      0000000000000000000000008400000084000000840000000000000000000000
      00008484840084848400000000000000000031003100F7FFF700C6CEC6001831
      1800290029009C009400840084006B1884008C0084008C008C005A005A006384
      6300D6D6D600DEE7DE004A184A00290029000000000000000000000000000000
      0000BDBDBD00BDBDBD0000000000FFFFFF00FFFFFF0000000000BDBDBD000000
      00000000000000000000000000007B7B7B0000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000008484840000000000000000004A004A0029422900290029009400
      94008C008C0094007B0000FFFF004A63A5009C0084008C0084008C008C008C00
      8C0063846300D6D6D600EFEFEF00000000007B7B7B0000000000BDBDBD000000
      0000BDBDBD0000000000BDBDBD00BDBDBD00BDBDBD00FFFFFF007B7B7B000000
      0000BDBDBD00BDBDBD00000000007B7B7B000000000000FFFF0000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      00000000000084848400000000000000000018001800A563A5008C008C008400
      8400840084008C0084007300730010C6D6001094A50073007300940084008C00
      8C005A005A006B846B00EFEFEF00000000007B7B7B0000000000BDBDBD00BDBD
      BD00FFFFFF00000000007B7B7B0000000000BDBDBD00FFFFFF007B7B7B00BDBD
      BD00BDBDBD00BDBDBD00000000007B7B7B0000000000FFFFFF000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000C6C6C60000008400000084000000840000008400000000000000
      000000000000C6C6C600000000000000000000000000100010009C6B9C008400
      84008400840084008400940084008400840000FFFF0000FFFF00840084009C00
      7B008C008C005A005A0084948400000000007B7B7B0000000000000000000000
      0000FFFFFF00000000007B7B7B007B7B7B00BDBDBD0000000000BDBDBD000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000FFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      00000000000000000000C6C6C600C6C6C6000000840000000000000000000000
      000084848400C6C6C60000000000000000000000000000000000100010009C6B
      9C00840084008C0084008400840084008400B5006B008400630000FFFF008400
      84008C0084008C008C006B006B00000000000000000000000000000000000000
      0000BDBDBD00FFFFFF00000000000000000000000000BDBDBD00BDBDBD000000
      0000000000007B7B7B00000000000000000000000000FFFFFF0000FFFF007B7B
      7B00000000000000000000000000000000007B7B7B00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000001000
      10009C6B9C008400840094007B0008F7FF00840084008400840000FFFF008400
      84008C0084008C008C00A500A5002100210000000000000000007B7B7B00BDBD
      BD007B7B7B00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBDBD007B7B7B007B7B
      7B007B7B7B00000000007B7B7B00000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000100010009C6B9C00840084009C007B0000FFFF0000FFFF00730073009400
      8C009C009C004A004A000000000000000000000000007B7B7B0000000000BDBD
      BD007B7B7B000000000000000000BDBDBD000000000000000000BDBDBD00BDBD
      BD00000000007B7B7B00000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C6008484840000000000000000000000000084848400C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000100010009C6B9C00840084008C00840094008400A5009C004A00
      4A000000000000000000000000000000000000000000000000007B7B7B000000
      00007B7B7B0000000000BDBDBD00BDBDBD00BDBDBD00000000007B7B7B000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000100010009C6B9C009C009C004A004A00000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B0000000000000000000000000000000000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000180018001800180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000008484008484
      840000848400848484000084840084000000FFFFFF0084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000848484000084
      840084848400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000008484008484
      840000848400848484000084840084000000FFFFFF0084000000840000008400
      0000FFFFFF008400000084000000840000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00FF000000FF00000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000848484000084
      840084848400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000FFFFFF00840000000000000000000000000000000000
      000000FFFF0000FFFF00FF000000FF000000FF000000FF00000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000008484008484
      840000848400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000840000000000000000000000000000000000000000FF
      FF0000FFFF00FF000000FF000000FF000000FF000000FF000000FF00000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      8400848484000084840084848400840000008400000084000000840000008400
      00008400000084000000000000000000000000000000000000000000000000FF
      FF0000FFFF00FF000000FF000000FF000000FF000000FF000000FF00000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484008484840000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00FF000000FF000000FF000000FF00000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484000084840000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00FF000000FF00000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484008484840000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B0000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      8400848484000000000000FFFF00000000000000000000FFFF00000000000084
      8400848484000084840000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00FFFFFF00BDBD
      BD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBD
      BD00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      0000BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF0000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD0000FFFF0000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000BDBDBD0000000000FF000000FF000000FF00
      00000000FF00FF000000FF00000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF00000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000000000BDBD
      BD00FFFFFF0000000000FFFFFF000000000000000000000000007B7B7B000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFD000000000000FFF8000000000000
      FFF1000000000000FFE3000000000000FFC7000000000000E08F000000000000
      C01F000000000000803F000000000000001F000000000000001F000000000000
      001F000000000000001F000000000000001F000000000000803F000000000000
      C07F000000000000E0FF000000000000FFFFFF3FFC7FFFFFF83FFC1FFC27E007
      E00FF00FEC23C003C007C007C401C001800300038001C00080030001C001C000
      00010000E00080070001000100000007000100010000000F000180010003001F
      0001C001E003001F8003E000C001001F8003F0038003001FC007F80FC407003F
      E00FFC3FEC3F81FFF83FFE7FFC7F81FFFFFFFFFFFFFFFE00FFFFFFFFF9FFC000
      FE7FF183F6CF8000F00FFBC7F6B78000E007F9C7F6B78000E007F807F8B78000
      E007FD8FFE8F8001C003FC8FFE3F8001C003FC8FFF7F8001E007FE1FFE3F8001
      E007FE1FFEBF87E1E007FE1FFC9F8001F00FFF3FFDDFC003FE7FFF7FFDDFFC3F
      FFFFFFFFFDDFFFFFFFFFFFFFFFFFFFFF8001FFFFFFFFFFFF0000FFFFFFFFFFFF
      0000FFFFFFFFFFFF0000F003800380030000FFFFFFFFFFFF00000003803F8003
      0000FFFFFFFFFFFF0000F00380038003E007FFFFFFFFFFFFE0070003803F8003
      E007FFFFFFFFFFFFE007F00380038003E00FFFFFFFFFFFFFE01F0003803F8003
      E03FFFFFFFFFFFFFE07FFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFF801FFF00F7F8
      FFFF0000FF00F7F8FFFF0000FF00EBFFC00F00000000ECFC800700000000DFFC
      800300000000DFFF800100000000BFFC800100000023FEFC800F80000001FE7F
      800F800000008013801FFC0000238013C0FFFC010063FE7FC0FFFC0300C3FEF8
      FFFFFC070107FFF8FFFFFFFF03FFFFFF00000000000000000000000000000000
      000000000000}
  end
  object XPMenu1: TXPMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = True
    Active = True
    Left = 68
    Top = 242
  end
end
