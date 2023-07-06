unit unCalckConstants;

interface

 uses inifiles, classes, SysUtils, stdctrls, buttons, ActnList, menus, extctrls,
        comctrls, UnUDBFunctions;

 Type

  TEnumToken = (calck_None, calck_Value, calck_Name, calck_ExternalName, calck_Function,
    calck_Not, calck_Or, calck_And, calck_Equality, calck_NotEquality, calck_Less, calck_More,
    calck_Plus, calck_Minus, calck_Mul, calck_Div, calck_LP, calck_RP, calck_Push,
    calck_Assign, calck_LM, calck_RM, calck_End);

  EunCalckError = class(Exception);

  TNum = class(TObject)
   private
    FStrNum: Integer;
    FCharNum: Integer;
   protected
   public
    property StrNum: Integer read FStrNum write FStrNum;
    property CharNum: Integer read FCharNum write FCharNum;
  end;

  const

   CLR = #13#10;
   _EDITOR = 'Editor';
   VAL_END = 'END';

 var

   ERROR_SET_POSITION_PROGRAMM: string;
   ERROR_NULL_PROGRAMM: string;
   ERROR_CREATE_STRING: string;
   ERROR_SKOBKI: string;

   ERROR_END_OF_STACK : string;

   ERROR_DONT_FIND_VARIABLE: string;

   ERROR_DONT_FIND_FUNCTION: string;
   ERROR_DONT_PRESENT_STACK: string;

   ERROR_DIV_0: string;
   ERROR_NOT_PR: string;
   ERROR_NOT_END_OF_PROGRAMM: string;
   ERROR_EXPRESSION_SYNTAX: string;
   ERROR_CREATE_PROCESS: string;

   ERROR_INDEX_PARAM: string;

   ERROR_CREATE_EXTERNAL: string;
   ERROR_FIND_EXTERNAL: string;

   ERROR_DONT_GET_PARAM: string;
   ERROR_DONT_FIND_LABEL_END_FOR: string;
   ERROR_DONT_FIND_LABEL: string;


   DONT_PARAMETRS: string;

  STR_1: string;
  STR_2: string;
  STR_3: string;
  STR_4: string;
  STR_5: string;
  STR_6: string;
  STR_7: string;
  STR_8: string;
  STR_9: string;
  STR_10: string;
  STR_11: string;
  STR_12: string;
  STR_13: string;
  STR_14: string;
  STR_15: string;
  STR_16: string;
  STR_17: string;
  STR_18: string;
  STR_19: string;
  STR_20: string;
  STR_21: string;
  STR_22: string;
  STR_23: string;
  //STR_24: string;
  STR_25: string;
  STR_26: string;
  STR_27: string;
  STR_28: string;
  STR_29: string;
  STR_30: string;
  STR_31: string;
  STR_32: string;
  STR_33: string;
  //STR_34: string;
  STR_35: string;
  STR_36: string;
  STR_37: string;
  STR_38: string;
  STR_39: string;
  STR_40: string;
  STR_41: string;
  STR_42: string;
  STR_43: string;
  STR_44: string;
  STR_45: string;
  STR_46: string;
  STR_47: string;
  STR_48: string;
  STR_49: string;
  STR_50: string;
  STR_51: string;
  STR_52: string;
  STR_53: string;
  STR_54: string;
  STR_55: string;
  STR_56: string;
  STR_57: string;
  STR_58: string;
  STR_59: string;
  STR_60: string;
  STR_61: string;
  STR_62: string;
  STR_63: string;
  STR_64: string;
  STR_65: string;
  STR_66: string;
  STR_67: string;
  STR_68: string;
  STR_69: string;
  STR_70: string;
  STR_71: string;
  STR_72: string;
  STR_73: string;
  STR_74: string;
  STR_75 : string;
  STR_76: string;
  STR_77: string;
  STR_78: string;
  STR_79: string;
  STR_80: string;
  STR_81: string;
  STR_82: string;
  STR_83: string;
  STR_84: string;
  STR_85: string;
  STR_86: string;
  STR_87: string;
  STR_88: string;
  STR_89: string;
  STR_90: string;
  STR_91: string;
  STR_92: string;
  STR_93: string;
  STR_94: string;
  STR_95: string;
  STR_96: string;
  STR_97: string;
  STR_98: string;
  STR_99: string;
  STR_100: string;
  STR_101: string;
  STR_102: string;
  STR_103: string;
  STR_104: string;
  STR_105: string;
  STR_106: string;
  STR_107: string;
  STR_108: string;
  STR_109: string;
  STR_110: string;
  STR_111: string;
  STR_112: string;
  STR_113: string;
  STR_114: string;
  STR_115: string;
  STR_116: string;
  STR_117: string;
  STR_118: string;
  STR_119: string;
  STR_120: string;
  STR_121: string;
  STR_122: string;
  STR_123: string;
  STR_124: string;
  STR_125: string;
  STR_126: string;
  STR_127: string;
  STR_128: string;
  STR_129: string;
  STR_130: string;
  STR_131: string;
  STR_132: string;
  STR_133: string;
  STR_134: string;
  STR_135: string;
  STR_136: string;
  STR_137: string;
  STR_138: string;
  STR_139: string;
  STR_140: string;
  STR_141: string;
  STR_142: string;
  STR_143: string;
  STR_144: string;
  STR_145: string;
  STR_146: string;
  STR_147: string;
  STR_148: string;
  STR_149: string;
  STR_150: string;
  STR_151: string;
  STR_152: string;
  STR_153: string;
  STR_154: string;
  STR_155: string;
  STR_156: string;
  STR_157: string;
  STR_158: string;
  STR_159: string;
  STR_160: string;
  STR_161: string;
  STR_162: string;

  STR_163: string;
  STR_164: string;
  STR_165: string;
  STR_166: string;

//procedure CheckLanguige(var FNextStep: Integer; IniFile: TIniFile; AContrl: TComponent);

implementation

var IniFile: TIniFile;
    TempStr: string;
    Step: Integer;

procedure CheckValueStr(var Value: string);
begin
  TempStr:=DeconvertString(IniFile.ReadString('Messages', 'STR_'+IntToStr(Step), ''));
  if TempStr = '' then
   IniFile.WriteString('Messages', 'STR_'+IntToStr(Step), ConvertString(Value))
  else
   Value:=TempStr;
  Step:=Step+1;
end;

{procedure CheckLanguige(var FNextStep: Integer; IniFile: TIniFile; AContrl: TComponent);
var Contrl: TComponent;
    I, J: Integer;
    TempStr: string;
    TempStr1: string;
    NextName: string;
begin
 if Trim(AContrl.Name) <> '' then
  begin
   for I:=0 to AContrl.ComponentCount-1 do
    begin
     Contrl:=AContrl.Components[I];
     NextName:=Contrl.Name;
     FNextStep:=FNextStep+1;
     TempStr:=DeconvertString(IniFile.ReadString(AContrl.Name, NextName, ''));
     TempStr1:=DeconvertString(IniFile.ReadString(AContrl.Name, NextName+'_Hint', ''));
     if Contrl is TLabel then
      begin
       if TempStr = '' then
        begin
         if (Contrl as TLabel).Caption <> '' then
          IniFile.WriteString(AContrl.Name, NextName, ConvertString((Contrl as TLabel).Caption));
         if (Contrl as TLabel).Hint <> '' then
          IniFile.WriteString(AContrl.Name, NextName+'_Hint', ConvertString((Contrl as TLabel).Hint));
        end
       else
        begin
         (Contrl as TLabel).Caption:=TempStr;
         (Contrl as TLabel).Hint:=TempStr1;
        end;
      end
     else if (Contrl is TButton) and ((Contrl as TButton).Action = nil) then
      begin
       if TempStr = '' then
        begin
         if (Contrl as TButton).Caption <> '' then
          IniFile.WriteString(AContrl.Name, NextName, ConvertString((Contrl as TButton).Caption));
         if (Contrl as TButton).Hint <> ''  then
          IniFile.WriteString(AContrl.Name, NextName+'_Hint', ConvertString((Contrl as TButton).Hint));
        end
       else
        begin
         (Contrl as TButton).Caption:=TempStr;
         (Contrl as TButton).Hint:=TempStr1;
        end
      end
     else if (Contrl is TCheckBox) and ((Contrl as TCheckBox).Action = nil) then
      begin
       if TempStr = '' then
        begin
         if (Contrl as TCheckBox).Caption <> '' then
          IniFile.WriteString(AContrl.Name, NextName, ConvertString((Contrl as TCheckBox).Caption));
         if (Contrl as TCheckBox).Hint <> '' then
          IniFile.WriteString(AContrl.Name, NextName+'_Hint', ConvertString((Contrl as TCheckBox).Hint));
        end
       else
        begin
         (Contrl as TCheckBox).Caption:=TempStr;
         (Contrl as TCheckBox).Hint:=TempStr1;
        end;
      end
     else if (Contrl is TRadioButton) and ((Contrl as TRadioButton).Action = nil) then
      begin
       if TempStr = '' then
        begin
         if (Contrl as TRadioButton).Caption <> '' then
          IniFile.WriteString(AContrl.Name, NextName, ConvertString((Contrl as TRadioButton).Caption));
         if (Contrl as TRadioButton).Hint <> '' then
          IniFile.WriteString(AContrl.Name, NextName+'_Hint', ConvertString((Contrl as TRadioButton).Hint));
        end
       else
        begin
         (Contrl as TRadioButton).Caption:=TempStr;
         (Contrl as TRadioButton).Hint:=TempStr1;
        end;
      end
     else if Contrl is TAction then
      begin
       if TempStr = '' then
        begin
         if (Contrl as TAction).Caption <> '' then
          IniFile.WriteString(AContrl.Name, NextName, ConvertString((Contrl as TAction).Caption));
         if (Contrl as TAction).Hint <> '' then
          IniFile.WriteString(AContrl.Name, NextName+'_Hint', ConvertString((Contrl as TAction).Hint));
        end
       else
        begin
         (Contrl as TAction).Caption:=TempStr;
         (Contrl as TAction).Hint:=TempStr1;
        end;
      end
     else if (Contrl is TMenuItem) and ((Contrl as TMenuItem).Action = nil) then
      begin
         if TempStr = '' then
          begin
           if ((Contrl as TMenuItem).Caption <> '') and ((Contrl as TMenuItem).Caption <> '-') then
            begin
             IniFile.WriteString(AContrl.Name, NextName, ConvertString((Contrl as TMenuItem).Caption));
             if (Contrl as TMenuItem).Hint <> '' then
              IniFile.WriteString(AContrl.Name, NextName+'_Hint', ConvertString((Contrl as TMenuItem).Hint));
           end;
          end
         else
          begin
           (Contrl as TMenuItem).Caption:=TempStr;
           (Contrl as TMenuItem).Hint:=TempStr1;
          end;
      end
     else if (Contrl is TPanel)  then
      begin
         if TempStr = '' then
          begin
           if (Contrl as TPanel).Caption <> '' then
            IniFile.WriteString(AContrl.Name, NextName, ConvertString((Contrl as TPanel).Caption));
           if (Contrl as TPanel).Hint <> '' then
            IniFile.WriteString(AContrl.Name, NextName+'_Hint', ConvertString((Contrl as TPanel).Hint));
          end
         else
          begin
           (Contrl as TPanel).Caption:=TempStr;
           (Contrl as TPanel).Hint:=TempStr1;
          end;
      end
     else if (Contrl is TComboBox) then
      begin
       for J:=0 to (Contrl as TComboBox).Items.Count-1 do
        begin
         TempStr:=DeconvertString(IniFile.ReadString(AContrl.Name, NextName+'_'+IntToStr(J), ''));
         if TempStr = '' then
          begin
           IniFile.WriteString(AContrl.Name, NextName+'_'+IntToStr(J), ConvertString((Contrl as TComboBox).Items[J]));
          end
         else
          begin
           (Contrl as TComboBox).Items[J]:=TempStr;
          end;
        end;
      end
     else if (Contrl is TStatusBar) then
      begin
       for J:=0 to (Contrl as TStatusBar).Panels.Count-1 do
        begin
         TempStr:=DeconvertString(IniFile.ReadString(AContrl.Name, NextName+'_'+IntToStr(J), ''));
         if TempStr = '' then
          begin
           if Trim((Contrl as TStatusBar).Panels[J].Text) <> '' then
            IniFile.WriteString(AContrl.Name, NextName+'_'+IntToStr(J), ConvertString((Contrl as TStatusBar).Panels[J].Text));
          end
         else
          begin
           (Contrl as TStatusBar).Panels[J].Text:=TempStr;
          end;
        end;
      end;
     CheckLanguige(FNextStep, IniFile, Contrl);
    end;
  end;
end;  }

initialization

    STR_1:='������ : ';
    STR_2:='������� :';
    STR_3:='������������ ������ �������� �����.';
    STR_4:='   ���. ';
    STR_5:='   ���. ';
    STR_6:='�� ������ ����������� !';
    STR_7:=' ������� ������ ��������� ������ �������.';
    STR_8:='���������';
    STR_9:='������� ���������� ��������� �� ��������� �����.';
   STR_10:='��� �����, �� ������� ����� �������� ���������� ���������.';
   STR_11:='���������� ����������� ����.';
   STR_12:='���������� ��������� �����.';
   STR_13:='���������� ��������� ���� � �����.';
   STR_14:='���������� ����� ������.';
   STR_15:='������, ����� ������� ����� ������.';
   STR_16:='��������� ������ � �����.';
   STR_17:='������, � ������� �������� �������� ����� ���������.';
   STR_18:='��������� ����� � ������.';
   STR_19:='�����, ������� �� ������ ��������� � ������';
   STR_20:='���������� ���� � ������.';
   STR_21:='����, ������� ����� ������������� � ������.';
   STR_22:='���������� ����, ��������������� �� ������.';
   STR_23:='������, ������� ����� ������������� � ����.';
   STR_25:='��������������� ����� � ������.';
   STR_26:='�����, ��� �������������� � ������.';
   STR_27:='��������������� ������ � �������.';
   STR_28:='������ ��� �������������� �� �����.';
   STR_29:='��������������� ���� � ����� � ������.';
   STR_30:='���� � ����� ��� �������������� � ������.';
   STR_31:='��������������� ������ � ���� � �������.';
   STR_32:='������ ��� �������������� �� �����.';
   STR_33:='����������� ����� Value � ������ �� �����';
   STR_35:='����� ��� �������������� - ������.';
   STR_36:='������� ����� ��� ��������������.';
   STR_37:='������� ������� �����.';
   STR_38:='������ � �������� ��������� �����';
   STR_39:='������� ������� ������.';
   STR_40:='������ � ��������� ��������� ������.';
   STR_41:='������� ������� �� ����� ������.';
   STR_42:='������ � ��������� ��������� �� �����.';
   STR_43:='���������� ������� ����� �����.';
   STR_44:='������� �����';
   STR_45:='���������� ����� ����� �����.';
   STR_46:='��������� ����� � �� � ������ ����� �������.';
   STR_47:='������� ����� ��� ����������.';
   STR_48:='���������� ������ ����� �������';
   STR_49:='���������� ���������� �������� �����.';
   STR_50:='���������� ������������ ����� �� ����.';
   STR_51:='���������� ����������� ����� �� ����.';
   STR_52:='������� �����.';
   STR_53:='������ �����.';
   STR_54:='���������� X � ������� Y.';
   STR_55:='��������� - ������� �����.';
   STR_56:='���������� - ������� �����.';
   STR_57:='����� �����.';
   STR_58:='� ��������.';
   STR_59:='���� � ��������.';
   STR_60:='������� �����.';
   STR_61:='������� �����.';
   STR_62:='���������� �����.';
   STR_63:='������� � ��������� �� ����� �.';
   STR_64:='���������� ��������� �� �����';
   STR_65:='�������� � ��������� �� ����� � � �.';
   STR_66:='������� ���������� ���������� ����� � � �.';
   STR_67:='���������� ��������� ����� � ��������� �� 0 ��';
   STR_68:='������� ������� �� ���� ��� ������ ���������� �����.';
   STR_69:='���������� �������� ����� �.';
   STR_70:='������� ����� ������� ����.';
   STR_71:='�������� � �� ��������� N.';
   STR_72:='��������� ���������.';
   STR_73:='��������� ������ � ������� �������.';
   STR_74:='������.';
   STR_75:='��������� ������ � ������ �������.';
   STR_76:='���������� ��� ������.';
   STR_77:='�������� �� ������ Str Count ��������, ������� � �������';
   STR_78:='������� ������ �����������.';
   STR_79:='���������� ��������.';
   STR_80:='���������� ������� ������ Str2 �';
   STR_81:='������� ������ Str �� ��������� ����� ������ �� �����';
   STR_82:='������������ ����� - ����� �����.';
   STR_83:='������ ����.';
   STR_84:='����.';
   STR_85:='������ ������.';
   STR_86:='������ ��������.';
   STR_87:='���������� ���� ������ ����';
   STR_88:='���������� ����, ����������� �� Count �������';
   STR_89:='���������� �������.';
   STR_90:='���������� true, ���� ��� �����������.';
   STR_91:='��� - ����� �����.';
   STR_92:='���������� ���������� ���� � ������.';
   STR_93:='���������� ���������� ���� � ����.';
   STR_94:='���������� ��� �� ����.';
   STR_95:='���������� ���� �� ����.';
   STR_96:='���������� ����� �� ����.';
   STR_97:='���������� ���� �� �������.';
   STR_98:='�����.';
   STR_99:='���������� ������ �� �������.';
  STR_100:='���������� ������� �� �������.';
  STR_101:='��������� ������ ������ �������������.';
  STR_102:='��������� ���� - ������.';
  STR_103:='��������� ������������ - ������';
  STR_104:='�������� �� ��������� - ������';
  STR_105:='������������� ��������� - ����� �����';
  STR_106:='��������� ������ ���� �������������.';
  STR_107:='�������� �� ��������� - ����';
  STR_108:='��������� ������ ����� �������������.';
  STR_109:='�������� �� ��������� - �����';
  STR_110:='��������� ������ ���� � ����� �������������.';
  STR_111:='�������� �� ��������� - ���� � �����';
  STR_112:='��������� ������ ����� ����� �������������.';
  STR_113:='�������� �� ��������� - ����� �����';
  STR_114:='��������� ������ ������� ����� �������������.';
  STR_115:='�������� �� ��������� - ������� �����';
  STR_116:='���������� ��������� ������������. ��� ������� �� ������ "������" ���������� true, ����� false.';
  STR_117:='��������� - ������.';
  STR_118:='��� ��������� :';
  STR_119:='  0 - ��������������';
  STR_120:='  1 - ������';
  STR_121:='  2 - ���������';
  STR_122:='  3 - ������';
  STR_123:='  4 - ��� ����';
  STR_124:='���������� ��������� ������������. ��� ������� �� ������ "������" ���������� true, ����� false.';
  STR_125:='������ ������.';
  STR_126:='��� ���������� !';
  STR_127:='������������� ����������� ������� �� ����� ����� �����. ���������� ������ �����������.';
  STR_128:='����������� - ������ �� ������ �������. ������ ���������� ������ ������ !';
  STR_129:='������������� ����������� ����. ���������� ������ �����������.';
  STR_130:='������������� ����������� �������. ���������� ������ �����������.';
  STR_131:='�������� �������������� �������� � ���������� �� ������, ���������� � ���������.';
  STR_132:='0. ��������� �� ������ - ������.';
  STR_133:='������������� ���������� �������������� ��������. � ��������� ���������� ��� �����, ���� ����� ������� �� ������.';
  STR_134:='0. ��� �����, ���� ������� �� ������.';
  STR_135:='������';
  STR_136:='�������';
  STR_137:='����';
  STR_138:='������';
  STR_139:='���';
  STR_140:='����';
  STR_141:='����';
  STR_142:='������';
  STR_143:='��������';
  STR_144:='�������';
  STR_145:='������';
  STR_146:='�������';
  STR_147:='�������� ��������!';
  STR_148:='���������� ��� ������, �������� ��� ������.';
  STR_149:='����� ������ - ����� ����� �� 1 �� 12.';
  STR_150:='������� ����, ��� ������ ����� ����� ������� ���������, ����� ��� ����� ���������';
  STR_151:='������� �� ���������� ������������, ������� � �����';
  STR_152:='������� �� ������������.';
  STR_153:='���������� Copyright � ����� ������ ������������.';

  STR_154:='�������������� ���� ����� ������ LabelName �';
  STR_155:='��� ����� � ��������� (":Label1") - ���������� ������';
  STR_156:='���������� ����������';
  STR_157:='��������� ������������� ������� ����� � ��������� ���������� ���������, ���� �����, ������� � ��������� �����.';
  STR_158:='��� �����, � ������� ��������� ���� FOR.';
  STR_159:='��������� ������� � ��������� �� ����� LabelTrue, ���� ������, ��� LabelFalse, ���� ����.';
  STR_160:='������� �������� - ���������� ���������.';
  STR_161:='��� �������� �������� �� ������.';
  STR_162:='��� ����� ��� �������� �� ���.';

   ERROR_SET_POSITION_PROGRAMM := '������ ��������� ������� ���������� ��������� !';
   ERROR_NULL_PROGRAMM := '��������� �� ������ !';
   ERROR_CREATE_STRING := '��������� ��������� �� ����� ����������� ������ !';
   ERROR_SKOBKI := '�� ��������� ���������� ����� � ������ ������ !';

   ERROR_END_OF_STACK := '��������� ����� ����� !';

   ERROR_DONT_FIND_VARIABLE := '���������� �� ������� !';

   ERROR_DONT_FIND_FUNCTION := '�� ������� ������� !';
   ERROR_DONT_PRESENT_STACK := '���� �� ����� ! ��� ����������� �������� ���������.';

   ERROR_DIV_0 := '������� �� ���� !';
   ERROR_NOT_PR := '������ ���� ������ ������ !';
   ERROR_NOT_END_OF_PROGRAMM := '�� ������ ����� ��������� !';
   ERROR_EXPRESSION_SYNTAX := '��������� �� �������������� !';
   ERROR_CREATE_PROCESS := '������ ���������� ��������� !';

   ERROR_INDEX_PARAM := '�������� ������ ������ ��������� !';

   ERROR_CREATE_EXTERNAL := '������ ���������� ������� ������� !';
   ERROR_FIND_EXTERNAL := '������ ������ ������� ������� !';

   ERROR_DONT_GET_PARAM := '�� ���������� ������� ��������� ���������� �������� ';
   ERROR_DONT_FIND_LABEL_END_FOR := '�� ������ ���� FOR ��� ����� ';
   ERROR_DONT_FIND_LABEL := '�� ������� ����� ';


   DONT_PARAMETRS := '��� ���������� !';

  STR_163:='��������, ������������ �� ������������ (�� ������������)';
  STR_164:='������';
  STR_165:='����';
  STR_166:='Pi = 3.1415926535897932385';

{
 IniFile:=TIniFile.Create('UnCalckLang.lan');
 try
  Step:=1;

   CheckValueStr(STR_1);
   CheckValueStr(STR_2);
   CheckValueStr(STR_3);
   CheckValueStr(STR_4);
   CheckValueStr(STR_5);
   CheckValueStr(STR_6);
   CheckValueStr(STR_7);
   CheckValueStr(STR_8);
   CheckValueStr(STR_9);
   CheckValueStr(STR_10);
   CheckValueStr(STR_11);
   CheckValueStr(STR_12);
   CheckValueStr(STR_13);
   CheckValueStr(STR_14);
   CheckValueStr(STR_15);
   CheckValueStr(STR_16);
   CheckValueStr(STR_17);
   CheckValueStr(STR_18);
   CheckValueStr(STR_19);
   CheckValueStr(STR_20);
   CheckValueStr(STR_21);
   CheckValueStr(STR_22);
   CheckValueStr(STR_23);
   //CheckValueStr(STR_24);
   CheckValueStr(STR_25);
   CheckValueStr(STR_26);
   CheckValueStr(STR_27);
   CheckValueStr(STR_28);
   CheckValueStr(STR_29);
   CheckValueStr(STR_30);
   CheckValueStr(STR_31);
   CheckValueStr(STR_32);
   CheckValueStr(STR_33);
   //CheckValueStr(STR_34);
   CheckValueStr(STR_35);
   CheckValueStr(STR_36);
   CheckValueStr(STR_37);
   CheckValueStr(STR_38);
   CheckValueStr(STR_39);
   CheckValueStr(STR_40);
   CheckValueStr(STR_41);
   CheckValueStr(STR_42);
   CheckValueStr(STR_43);
   CheckValueStr(STR_44);
   CheckValueStr(STR_45);
   CheckValueStr(STR_46);
   CheckValueStr(STR_47);
   CheckValueStr(STR_48);
   CheckValueStr(STR_49);
   CheckValueStr(STR_50);
   CheckValueStr(STR_51);
   CheckValueStr(STR_52);
   CheckValueStr(STR_53);
   CheckValueStr(STR_54);
   CheckValueStr(STR_55);
   CheckValueStr(STR_56);
   CheckValueStr(STR_57);
   CheckValueStr(STR_58);
   CheckValueStr(STR_59);
   CheckValueStr(STR_60);
   CheckValueStr(STR_61);
   CheckValueStr(STR_62);
   CheckValueStr(STR_63);
   CheckValueStr(STR_64);
   CheckValueStr(STR_65);
   CheckValueStr(STR_66);
   CheckValueStr(STR_67);
   CheckValueStr(STR_68);
   CheckValueStr(STR_69);
   CheckValueStr(STR_70);
   CheckValueStr(STR_71);
   CheckValueStr(STR_72);
   CheckValueStr(STR_73);
   CheckValueStr(STR_74);
   CheckValueStr(STR_75);
   CheckValueStr(STR_76);
   CheckValueStr(STR_77);
   CheckValueStr(STR_78);
   CheckValueStr(STR_79);
   CheckValueStr(STR_80);
   CheckValueStr(STR_81);
   CheckValueStr(STR_82);
   CheckValueStr(STR_83);
   CheckValueStr(STR_84);
   CheckValueStr(STR_85);
   CheckValueStr(STR_86);
   CheckValueStr(STR_87);
   CheckValueStr(STR_88);
   CheckValueStr(STR_89);
   CheckValueStr(STR_90);

   CheckValueStr(STR_91);
   CheckValueStr(STR_92);
   CheckValueStr(STR_93);
   CheckValueStr(STR_94);
   CheckValueStr(STR_95);
   CheckValueStr(STR_96);
   CheckValueStr(STR_97);
   CheckValueStr(STR_98);
   CheckValueStr(STR_99);
   CheckValueStr(STR_100);
   CheckValueStr(STR_101);
   CheckValueStr(STR_102);
   CheckValueStr(STR_103);
   CheckValueStr(STR_104);
   CheckValueStr(STR_105);
   CheckValueStr(STR_106);
   CheckValueStr(STR_107);
   CheckValueStr(STR_108);
   CheckValueStr(STR_109);
   CheckValueStr(STR_110);
   CheckValueStr(STR_111);
   CheckValueStr(STR_112);
   CheckValueStr(STR_113);
   CheckValueStr(STR_114);
   CheckValueStr(STR_115);
   CheckValueStr(STR_116);
   CheckValueStr(STR_117);
   CheckValueStr(STR_118);
   CheckValueStr(STR_119);
   CheckValueStr(STR_120);
   CheckValueStr(STR_121);
   CheckValueStr(STR_122);
   CheckValueStr(STR_123);
   CheckValueStr(STR_124);
   CheckValueStr(STR_125);
   CheckValueStr(STR_126);
   CheckValueStr(STR_127);
   CheckValueStr(STR_128);
   CheckValueStr(STR_129);
   CheckValueStr(STR_130);
   CheckValueStr(STR_131);
   CheckValueStr(STR_132);
   CheckValueStr(STR_133);
   CheckValueStr(STR_134);
   CheckValueStr(STR_135);
   CheckValueStr(STR_136);
   CheckValueStr(STR_137);
   CheckValueStr(STR_138);
   CheckValueStr(STR_139);
   CheckValueStr(STR_140);
   CheckValueStr(STR_141);
   CheckValueStr(STR_142);
   CheckValueStr(STR_143);
   CheckValueStr(STR_144);
   CheckValueStr(STR_145);
   CheckValueStr(STR_146);
   CheckValueStr(STR_147);
   CheckValueStr(STR_148);
   CheckValueStr(STR_149);
   CheckValueStr(STR_150);
   CheckValueStr(STR_151);
   CheckValueStr(STR_152);
   CheckValueStr(STR_153);


   CheckValueStr(ERROR_SET_POSITION_PROGRAMM);
   CheckValueStr(ERROR_NULL_PROGRAMM);
   CheckValueStr(ERROR_CREATE_STRING);
   CheckValueStr(ERROR_SKOBKI);

   CheckValueStr(ERROR_END_OF_STACK);

   CheckValueStr(ERROR_DONT_FIND_VARIABLE);

   CheckValueStr(ERROR_DONT_FIND_FUNCTION);
   CheckValueStr(ERROR_DONT_PRESENT_STACK);

   CheckValueStr(ERROR_DIV_0);
   CheckValueStr(ERROR_NOT_PR);
   CheckValueStr(ERROR_NOT_END_OF_PROGRAMM);
   CheckValueStr(ERROR_EXPRESSION_SYNTAX);
   CheckValueStr(ERROR_CREATE_PROCESS);

   CheckValueStr(ERROR_INDEX_PARAM);

   CheckValueStr(ERROR_CREATE_EXTERNAL);
   CheckValueStr(ERROR_FIND_EXTERNAL);

   CheckValueStr(ERROR_DONT_GET_PARAM);
   CheckValueStr(ERROR_DONT_FIND_LABEL_END_FOR);
   CheckValueStr(ERROR_DONT_FIND_LABEL);


   CheckValueStr(DONT_PARAMETRS);

   CheckValueStr(STR_154);
   CheckValueStr(STR_155);
   CheckValueStr(STR_156);
   CheckValueStr(STR_157);
   CheckValueStr(STR_158);
   CheckValueStr(STR_159);
   CheckValueStr(STR_160);
   CheckValueStr(STR_161);
   CheckValueStr(STR_162);

   CheckValueStr(STR_163);
   CheckValueStr(STR_164);
   CheckValueStr(STR_165);
   CheckValueStr(STR_166);

 finally
  IniFile.Free;
 end;
       }

end.
