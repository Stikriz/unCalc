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

    STR_1:='Строка : ';
    STR_2:='Позиция :';
    STR_3:='Неправильный формат дробного числа.';
    STR_4:='   Стр. ';
    STR_5:='   Кол. ';
    STR_6:='Не указан калькулятор !';
    STR_7:=' Поэтому нельзя заполнить список функций.';
    STR_8:='Программа';
    STR_9:='Переход выполнения программы на указанную метку.';
   STR_10:='Имя метки, на которую нужно передать выполнение программы.';
   STR_11:='Возвращает сегодняшнюю дату.';
   STR_12:='Возвращает настоящее время.';
   STR_13:='Возвращает настоящую дату и время.';
   STR_14:='Возвращает длину строки.';
   STR_15:='Строка, длину которой нужно узнать.';
   STR_16:='Переводит строку в число.';
   STR_17:='Строка, в которой записано значение числа символами.';
   STR_18:='Переводит число в строку.';
   STR_19:='Число, которое Вы хотите перевести в строку';
   STR_20:='Возвращает дату в строке.';
   STR_21:='Дата, которую нужно преобразовать к строке.';
   STR_22:='Возвращает дату, преобразованную из строки.';
   STR_23:='Строка, которую нужно преобразовать к дате.';
   STR_25:='Преобразовывает время в строку.';
   STR_26:='Время, для преобразования в строку.';
   STR_27:='Перобразовывает строку к времени.';
   STR_28:='Строка для преобразования во время.';
   STR_29:='Преобразовывает дату и время к строке.';
   STR_30:='Дата и время для преобразования в строку.';
   STR_31:='Преобразовывает строку к дате и времени.';
   STR_32:='Строка для преобразования во время.';
   STR_33:='Форматирует число Value в строку по маске';
   STR_35:='Маска для форматирования - строка.';
   STR_36:='Дробное число для форматирования.';
   STR_37:='Удаляет пробелы слева.';
   STR_38:='Строка с ненужыми пробелами слева';
   STR_39:='Удаляет пробелы справа.';
   STR_40:='Строка с ненужными пробелами справа.';
   STR_41:='Удаляет пробелы по краям строки.';
   STR_42:='Строка с ненужными пробелами по краям.';
   STR_43:='Возвращает дробную часть числа.';
   STR_44:='Дробное число';
   STR_45:='Возвращает целую часть числа.';
   STR_46:='Округляет число Х до У знаков после запятой.';
   STR_47:='Дробное число для округления.';
   STR_48:='Количество знаков после запятой';
   STR_49:='Возвращает абсолютное значение числа.';
   STR_50:='Возвращает максимальное число из двух.';
   STR_51:='Возвращает минимальное число из двух.';
   STR_52:='Квадрат числа.';
   STR_53:='Корень числа.';
   STR_54:='Возвращает X в степени Y.';
   STR_55:='Основание - дробное число.';
   STR_56:='Экспонента - дробное число.';
   STR_57:='Синус числа.';
   STR_58:='в радианах.';
   STR_59:='Угол в радианах.';
   STR_60:='Косинус числа.';
   STR_61:='Тангенс числа.';
   STR_62:='Арктангенс числа.';
   STR_63:='Вернуть У процентов от числа Х.';
   STR_64:='Количество процентов от числа';
   STR_65:='Добавить У процентов от числа Х к Х.';
   STR_66:='Вернуть процентное содержание числа У в Х.';
   STR_67:='Возвращает случайное число в диапазоне от 0 до';
   STR_68:='Верхняя граница от нуля для выдачи случайного числа.';
   STR_69:='Десятичный логарифм числа Х.';
   STR_70:='Дробное число большее нуля.';
   STR_71:='Логарифм Х по основанию N.';
   STR_72:='Основание логарифма.';
   STR_73:='Переводит строку в верхний регистр.';
   STR_74:='Строка.';
   STR_75:='Переводит строку в нижний регистр.';
   STR_76:='Сравнивает две строки.';
   STR_77:='Копирует из строки Str Count символов, начиная с позиции';
   STR_78:='Позиция начала копирования.';
   STR_79:='Количество символов.';
   STR_80:='Возвращает позицию строки Str2 в';
   STR_81:='Разбить строку Str на несколько строк длиной не более';
   STR_82:='Максимальная длина - целое число.';
   STR_83:='Начала года.';
   STR_84:='Дата.';
   STR_85:='Начала месяца.';
   STR_86:='Начала квартала.';
   STR_87:='Возвращает день недели даты';
   STR_88:='Возвращает дату, увеличенную на Count месяцев';
   STR_89:='Количество месяцев.';
   STR_90:='Возвращает true, если год высокостный.';
   STR_91:='Год - целое число.';
   STR_92:='Возвращает количество дней в месяце.';
   STR_93:='Возвращает количество дней в году.';
   STR_94:='Возвращает год из даты.';
   STR_95:='Возвращает день из даты.';
   STR_96:='Возвращает месяц из даты.';
   STR_97:='Возвращает часы из времени.';
   STR_98:='Время.';
   STR_99:='Возвращает минуты из времени.';
  STR_100:='Возвращает секунды из времени.';
  STR_101:='Позволяет ввести строку пользователем.';
  STR_102:='Заголовок окна - строка.';
  STR_103:='Подсказка пользователю - строка';
  STR_104:='Значение по умолчанию - строка';
  STR_105:='Идентификатор подсказки - целое число';
  STR_106:='Позволяет ввести дату пользователем.';
  STR_107:='Значение по умолчанию - дата';
  STR_108:='Позволяет ввести время пользователем.';
  STR_109:='Значение по умолчанию - время';
  STR_110:='Позволяет ввести дату и время пользователем.';
  STR_111:='Значение по умолчанию - дата и время';
  STR_112:='Позволяет ввести целое число пользователем.';
  STR_113:='Значение по умолчанию - целое число';
  STR_114:='Позволяет ввести дробное число пользователем.';
  STR_115:='Значение по умолчанию - дробное число';
  STR_116:='Показывает сообщение пользователю. При нажатии на кнопку "Готово" возвращает true, иначе false.';
  STR_117:='Сообщение - строка.';
  STR_118:='Тип сообщения :';
  STR_119:='  0 - предупреждение';
  STR_120:='  1 - ошибка';
  STR_121:='  2 - сообщение';
  STR_122:='  3 - вопрос';
  STR_123:='  4 - без типа';
  STR_124:='Показывает сообщение пользователю. При нажатии на кнопку "Готово" возвращает true, иначе false.';
  STR_125:='Подает сигнал.';
  STR_126:='Нет параметров !';
  STR_127:='Устанавливает разделитель дробной от целой части числа. Возвращает старый разделитель.';
  STR_128:='Разделитель - строка из одного символа. Нельзя передавать пустую строку !';
  STR_129:='Устанавливает разделитель даты. Возвращает старый разделитель.';
  STR_130:='Устанавливает разделитель времени. Возвращает старый разделитель.';
  STR_131:='Вызывает исключитедьную ситуацию с сообщением об ошибке, переданном в параметре.';
  STR_132:='0. Сообщение об ошибке - строка.';
  STR_133:='Устанавливает обработчик исключительной ситуации. В параметре передается имя метки, куда нужно перейти по ошибке.';
  STR_134:='0. Имя метки, куда перейти по ошибке.';
  STR_135:='Январь';
  STR_136:='Февраль';
  STR_137:='Март';
  STR_138:='Апрель';
  STR_139:='Май';
  STR_140:='Июнь';
  STR_141:='Июль';
  STR_142:='Август';
  STR_143:='Сентябрь';
  STR_144:='Октябрь';
  STR_145:='Ноябрь';
  STR_146:='Декабрь';
  STR_147:='Неверное значение!';
  STR_148:='Возвращает имя месяца, согласно его номеру.';
  STR_149:='Номер месяца - целое число от 1 до 12.';
  STR_150:='Признак того, что первую букву нужно сделать прописной, иначе она будет заглавной';
  STR_151:='Переход на выполнение подпрограммы, начиная с метки';
  STR_152:='Возврат из подпрограммы.';
  STR_153:='Возвращает Copyright и номер версии калькулятора.';

  STR_154:='Инициализирует цикл между меткой LabelName и';
  STR_155:='Имя метки в программе (":Label1") - уникальная строка';
  STR_156:='Количество повторений';
  STR_157:='Проверяет необходимость повтора цикла и переводит выполнение программы, если нужно, начиная с указанной метки.';
  STR_158:='Имя метки, с которой начинался цикл FOR.';
  STR_159:='Проверяет условие и переходит по метке LabelTrue, если истина, или LabelFalse, если ложь.';
  STR_160:='Условие перехода - логическое выражение.';
  STR_161:='Имя меткидля перехода по истине.';
  STR_162:='Имя метки для перехода по лжи.';

   ERROR_SET_POSITION_PROGRAMM := 'Ошибка установки позиции выполнения программы !';
   ERROR_NULL_PROGRAMM := 'Программа не задана !';
   ERROR_CREATE_STRING := 'Строковая константа не имеет завершающей скобки !';
   ERROR_SKOBKI := 'Не совпадает количество левых и правых скобок !';

   ERROR_END_OF_STACK := 'Достигнут конец стека !';

   ERROR_DONT_FIND_VARIABLE := 'Переменная не найдена !';

   ERROR_DONT_FIND_FUNCTION := 'Не найдена функция !';
   ERROR_DONT_PRESENT_STACK := 'Стек не задан ! Нет возможности передать параметры.';

   ERROR_DIV_0 := 'Деление на ноль !';
   ERROR_NOT_PR := 'Должна быть правая скобка !';
   ERROR_NOT_END_OF_PROGRAMM := 'Не найден конец программы !';
   ERROR_EXPRESSION_SYNTAX := 'Синтаксис не поддерживается !';
   ERROR_CREATE_PROCESS := 'Ошибка выполнения программы !';

   ERROR_INDEX_PARAM := 'Неверный индекс номера параметра !';

   ERROR_CREATE_EXTERNAL := 'Ошибка выполнения внешней функции !';
   ERROR_FIND_EXTERNAL := 'Ошибка поиска внешней функции !';

   ERROR_DONT_GET_PARAM := 'Не определено событие получения параметров функцией ';
   ERROR_DONT_FIND_LABEL_END_FOR := 'Не найден цикл FOR для метки ';
   ERROR_DONT_FIND_LABEL := 'Не найдена метка ';


   DONT_PARAMETRS := 'Нет параметров !';

  STR_163:='Значение, возвращаемое из калькулятора (не используется)';
  STR_164:='Истина';
  STR_165:='Ложь';
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
