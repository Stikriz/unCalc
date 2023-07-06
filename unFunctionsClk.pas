unit unFunctionsClk;

interface

 uses classes, Sysutils, Math, unStack, unCompiler, unCalckConstants, Variants;

 Type

 TOnGetParam = procedure(Var Value: Variant) of Object;
 TOnGetTuken = procedure of Object;

 TunFunctions = class;

 TunFunction = class(TObject)
  private
   FOnGetParam: TOnGetParam;
   FInternalName: string;
   FOwner: TunFunctions;
  protected
   function GetFuncName: string; virtual; abstract;
   function GetLikeFuncName: string; virtual; abstract;
   function GetParamCount: Integer; virtual; abstract;
   function GetHint: string; virtual; abstract;
   function GetParamHint(const Index: Integer): string; virtual; abstract;
  public
   constructor Create(); virtual;
   destructor Destroy; override;
   function Execute: variant; virtual; abstract;
   property Owner: TunFunctions read FOwner write FOwner;
   property FuncName: string read GetFuncName;
   property LikeFuncName: string read GetLikeFuncName;
   property InternalFuncName: string read FInternalName write FInternalName;
   property ParamCount: Integer read GetParamCount;
   property ParamHint[const Index: Integer]: string read GetParamHint;
   property Hint: string read GetHint;
   property OnGetParam: TOnGetParam read FOnGetParam write FOnGetParam;
 end;

 TunFunctions = class(TObject)
  private
   FListFunctions: TList;
   FStack: TunStack;
  protected
   procedure Clear;
   procedure FreeFors;
   procedure DoGetParam(var Param: Variant);
   function GetCount: Integer;
   function GetFuncHint(const Index: Integer): string;
   function GetFuncName(const Index: Integer): string;
   function GetLikeFuncName(const Index: Integer): string;
   function GetFuncParamCount(const Index: Integer): Integer;
   function GetFuncParamHint(const IndexFunc, IndexParam: Integer): string;
   function GetInternalFuncName(const Index: Integer): string;
  public
   ACompiler: TunCompiler;
   AStalker: Pointer;
   AListFors: TList;
   constructor Create;
   destructor Destroy; override;
   function Execute(const AInternalNameFunc: string): Variant; overload;
   function Execute(const Index: Integer): Variant; overload;
   function Check(const AName: string): boolean;
   function TranslateName(const AName: string): string;
   function IndexByName(const AName: string): Integer;
   property Count: Integer read GetCount;
   property FuncName[const Index: Integer]: string read GetFuncName;
   property LikeFuncName[const Index: Integer]: string read GetLikeFuncName;
   property FuncHint[const Index: Integer]: string read GetFuncHint;
   property FuncParamHint[const IndexFunc, IndexParam: Integer]: string read GetFuncParamHint;
   property InternalFuncName[const Index: Integer]: string read GetInternalFuncName;
   property FuncParamCount[const Index: Integer]: Integer read GetFuncParamCount;
   property Stack: TunStack  read FStack write FStack;
 end;

 {
  Цикл
  Переход по условию (IF)
  Безусловный переход

  Дата
  Время
  ДатаВремя
  Начало года
  Начало месяца
  Начало квартала
  Количество дней в неделе
  Количество дней в месяце
  Количество дней в году
  Выташить год из даты
  Вытащить день из даты
  Вытащить месяц из даты
  Вытащить часы из времени
  Вытащить минуты из времени
  Вытащить секунды из времени

  Длина строки
  Строку в число
  Число в строку
  Дату в строку
  Строку в дату
  Время в строку
  Строку во время
  ДатуВремя в строку
  Строку в датуВремя
  Форматирование числа
  Целое число в символ
  Символ в целое число
  Удалить пробелы слева
  Удалить пробелы справа
  Удалить пробелы с двух сторон
  Строку в верхний регистр
  Строку в нижний регистр
  Символ в верхний регистр
  Символ в нижний регистр
  Сравнить две строки
  Позиция подстроки в строке
  Удалить подстроку из строки   procedure Delete(var S: string; Index, Count:Integer);
  Вставить подстроку в строку
  Разбить строку на несколько строк определенной длины  function WrapText(const Line, BreakStr: string; nBreakChars: TSysCharSet; MaxCol: Integer):string;
  Печать суммы строкой

  Дробная часть числа
  Целая часть числа
  Округлить Х до У знаков
  Абсолютное значение
  Максимальное из двух значений
  Минимальное из двух значений
  Корень числа
  Х в степень У
  Натуральный логарифм
  Десятичный логарифм
  Логарифм Х по основанию У
  Экспонента

  Pi
  Синус
  Косинус
  Тангенс
  Котангенс

  Процент Х от У
  Добавить к числу Х У процентов от Х
  Отнять от числа Х У процентов от Х
  Вернуть У процентов от Х, где У - кол-во процентов
  Случайное число

  Поместить текст в буфер обмена
  Извлечь текст из буфера обмена
  Создать OLE объект
  Уничтожить OLE объект
  Вызвать функцию OLE объекта

  Диалог ввода строки
  Диалог ввода даты
  Диалог ввода времени
  Диалог ввода даты и времени
  Диалог ввода целого числа
  Диалог ввода дробного числа
  Диалог ввода денег
  Диалог Сообщения
  Сигнал

  Установить разделитель дробной части
  Установить разделитель времени
  Установить разделитель даты
  Установить разделитель дробной денежной части

  Номер версии калькулятора
 }

 TForParams = class(TObject)
  public
   LabelName: string;
   Count: Integer;
 end;

 TunForCommand = class(TunFunction)
  private
   FCount: Integer;
   FLabel: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TEndForCommand = class(TunFunction)
  private
   FLabelName: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TIfCommand = class(TunFunction)
  private
   FisTrue: boolean;
   FLabelTrue: string;
   FLabelFalse: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TGoToCommand = class(TunFunction)
  private
   FLabel: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDateFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TTimeFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDateTimeFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TLengthFunc = class(TunFunction)
  private
   FStr: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TStrToFloat = class(TunFunction)
  private
   FStr: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TFloatToStr = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDateToStrFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TStrToDateFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TTimeToStrFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TStrToTimeFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDateTimeToStr = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TStrToDateTime = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TFormatFloatFunc = class(TunFunction)
  private
   FMaska: string;
   FValue: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TLTrimFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TRTrimFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TTrimFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TFracFunc = class(TunFunction)
  private
   Val: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TIntFunc = class(TunFunction)
  private
   Val: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TRoundFunc = class(TunFunction)
  private
   FFracVal: Extended;
   FIntVal: Integer;
   FCount: Integer;
   FBase: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TABSFunc = class(TunFunction)
  private
   FVal: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TMaxFunc = class(TunFunction)
  private
   FVal1: Extended;
   FVal2: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TMinFunc = class(TunFunction)
  private
   FVal1: Extended;
   FVal2: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TSQRFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TSQRTFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TPowerFunc = class(TunFunction)
  private
   FBase: Extended;
   FExponent: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TSinFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TCosFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TTanFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TArcTanFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TProcentFunc = class(TunFunction)
  private
   FVal: Extended;
   FPrc: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TAddProcentFunc = class(TunFunction)
  private
   FVal: Extended;
   FPrc: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TIncludeProcentFunc = class(TunFunction)
  private
   FVal: Extended;
   FPrc: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TRandomFunc = class(TunFunction)
  private
   FRange: Integer;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TLGFunc = class(TunFunction)
  private
   FVal: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TLogFunc = class(TunFunction)
  private
   FVal: Extended;
   FN: Extended;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TUpperCaseFunc = class(TunFunction)
  private
   FVal: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TLoverCaseFunc = class(TunFunction)
  private
   FVal: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TCompareFunc = class(TunFunction)
  private
   FVal1: string;
   FVal2: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TCopyStrFunc = class(TunFunction)
  private
   FVal: string;
   FStart: Integer;
   FCount: Integer;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TAnsiPos = class(TunFunction)
  private
   FVal1: string;
   FVal2: string;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TWrapTextFunc = class(TunFunction)
  private
   FVal: string;
   FCount: Integer;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TStartYearFunc = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TStartMonthFunc = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TStartQuarterFunc = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDayOfWeekFunc = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TIncMonthFunc = class(TunFunction)
  private
   FVal: TDateTime;
   FCount: Integer;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TIsLeapYearFunc = class(TunFunction)
  private
   FVal: Integer;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDaysInMonth = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDaysInYear = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDateToYear = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDateToDay = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TDateToMonth = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TTimeToHour = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TTimeToMinute = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TTimeToSec = class(TunFunction)
  private
   FVal: TDateTime;
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TInputStringFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TInputDateFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TInputTimeFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TInputDateTimeFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TInputIntegerFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TInputFloatFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TShowMessageFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TBeepFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TSetDecimalSeparatorFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TSetDateSeparatorFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TSetTimeSeparatorFunc = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TRaiseCommand = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TExceptCommand = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TMonthNameByNumber = class(TunFunction)
  private
  protected
   FNamesMonth: array[1..12] of string[10];
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TGoSub = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TReturn = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TShowDilog = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetLikeFuncName: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TOrd = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetLikeFuncName: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TChr = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetLikeFuncName: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVarArrayOf = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetLikeFuncName: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 {TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;
}

 TVersionName = class(TunFunction)
  private
  protected
   function GetFuncName: string; override;
   function GetLikeFuncName: string; override;
   function GetParamCount: Integer; override;
   function GetHint: string; override;
   function GetParamHint(const Index: Integer): string;  override;
  public
   constructor Create; override;
   destructor Destroy; override;
   function Execute: variant; override;
 end;

 var ATimeSeparator: Char;
     ADateSeparator: Char;
     ADecimalSeparator: Char;
     AOldTimeSeparator: Char;
     AOldDateSeparator: Char;
     AOldDecimalSeparator: Char;


// procedure RegistryFunctions(const Container: TunFunctions);

implementation

Uses unStalker, DialogForm, ExtendedDialogForm, IntegerDialogForm, DateTimeDialogForm,
     TimeDialogForm, DateDialogForm, StringDialogForm, Controls, Forms, Dialogs;

{Удаляем циклы}

{ Регистрация функций }

procedure RegistryFunctions(const Container: TunFunctions);
var Func: TunFunction;
begin
 Func:=TunForCommand.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_0';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TEndForCommand.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_1';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TIfCommand.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_2';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TGoToCommand.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_3';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDateFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_4';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TTimeFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_5';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDateTimeFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_6';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TLengthFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_7';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TStrToFloat.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_8';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TFloatToStr.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_9';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDateToStrFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_10';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TStrToDateFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_11';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TTimeToStrFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_12';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TStrToTimeFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_13';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDateTimeToStr.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_14';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TStrToDateTime.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_15';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TFormatFloatFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_16';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TLTrimFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_17';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TRTrimFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_18';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TTrimFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_19';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TFracFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_20';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TIntFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_21';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TRoundFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_22';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TABSFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_23';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TMaxFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_24';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TMinFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_25';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TSQRFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_26';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TSQRTFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_27';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TPowerFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_28';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TSinFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_29';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TCosFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_30';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TTanFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_31';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TArcTanFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_32';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TProcentFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_33';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TAddProcentFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_34';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TIncludeProcentFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_35';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TRandomFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_36';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TLGFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_37';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TLogFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_38';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TUpperCaseFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_39';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TLoverCaseFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_40';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TCompareFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_41';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TCopyStrFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_42';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TAnsiPos.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_43';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TWrapTextFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_44';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TStartYearFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_45';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TStartMonthFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_46';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TStartQuarterFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_47';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDayOfWeekFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_48';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TIncMonthFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_49';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TIsLeapYearFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_50';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDaysInMonth.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_51';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDaysInYear.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_52';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDateToYear.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_53';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDateToDay.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_54';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TDateToMonth.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_55';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TTimeToHour.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_56';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TTimeToMinute.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_57';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TTimeToSec.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_58';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TInputStringFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_59';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TInputDateFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_60';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TInputTimeFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_61';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TInputDateTimeFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_62';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TInputIntegerFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_63';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TInputFloatFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_64';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TShowMessageFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_65';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TBeepFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_66';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TSetDecimalSeparatorFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_67';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TSetDateSeparatorFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_68';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TSetTimeSeparatorFunc.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_69';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TRaiseCommand.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_70';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TExceptCommand.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_71';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TVersionName.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_72';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TMonthNameByNumber.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_73';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TGoSub.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_74';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TReturn.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_75';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TShowDilog.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_76';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;


 Func:=TOrd.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_77';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TChr.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_78';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;

 Func:=TVarArrayOf.Create;
 Container.FListFunctions.Add(Func);
 Func.InternalFuncName:='_79';
 Func.OnGetParam:=Container.DoGetParam;
 Func.Owner:=Container;


end;

{ TunFunction }

constructor TunFunction.Create;
begin
 inherited Create;
end;

destructor TunFunction.Destroy;
begin
  inherited;
end;

{ TunFunctions }

constructor TunFunctions.Create;
begin
 inherited Create;
 FListFunctions:=TList.Create;
 AListFors:=TList.Create;
 RegistryFunctions(Self);
end;

destructor TunFunctions.Destroy;
begin
 Clear;
 AListFors.Free;
 FListFunctions.Free;
  inherited;
end;

procedure TunFunctions.Clear;
var I: Integer;
    Func: TunFunction;
begin
 for I:=0 to FListFunctions.Count-1 do
  begin
   Func:=FListFunctions[I];
   Func.Free;
  end;
 FListFunctions.Clear;
 FreeFors;
end;

procedure TunFunctions.FreeFors;
var I: Integer;
    Fors: TForParams;
begin
 for I:=0 to AListFors.Count-1 do
  begin
   Fors:=AListFors[I];
   Fors.Free;
  end;
 AListFors.Clear;
end;

function TunFunctions.Check(const AName: string): boolean;
var I: Integer;
    Func: TunFunction;
begin
 Result:=false;
 for I:=0 to FListFunctions.Count-1 do
  begin
   Func:=FListFunctions[I];
   if Func.InternalFuncName = AName then
    begin
     Result:=true;
     break;
    end;
  end;
end;

procedure TunFunctions.DoGetParam(var Param: Variant);
begin
 if Assigned(FStack) then
  Param:=FStack.Pop
 else
  raise EunCalckError.Create(ERROR_DONT_PRESENT_STACK);
end;

function TunFunctions.Execute(const AInternalNameFunc: string): Variant;
var I: Integer;
    Func: TunFunction;
    isOk: boolean;
begin
 isOk:=false;
 for I:=0 to FListFunctions.Count-1 do
  begin
   Func:=FListFunctions[I];
   if Func.InternalFuncName = AInternalNameFunc then
    begin
     Result:=Func.Execute;
     isOk:=true;
     break;
    end;
  end;
 if not isOk then
  raise EunCalckError.Create(ERROR_DONT_FIND_FUNCTION);
end;

function TunFunctions.Execute(const Index: Integer): Variant;
var Func: TunFunction;
begin
 Func:=FListFunctions[Index];
 Result:=Func.Execute;
end;

function TunFunctions.GetCount: Integer;
begin
 Result:=FListFunctions.Count;
end;

function TunFunctions.GetFuncHint(const Index: Integer): string;
var Func: TunFunction;
begin
 Func:=FListFunctions[Index];
 Result:=Func.Hint;
end;

function TunFunctions.GetFuncName(const Index: Integer): string;
var Func: TunFunction;
begin
 Func:=FListFunctions[Index];
 Result:=Func.FuncName;
end;

function TunFunctions.GetFuncParamCount(const Index: Integer): Integer;
var Func: TunFunction;
begin
 Func:=FListFunctions[Index];
 Result:=Func.ParamCount;
end;

function TunFunctions.GetFuncParamHint(const IndexFunc, IndexParam: Integer): string;
var Func: TunFunction;
begin
 Func:=FListFunctions[IndexFunc];
 Result:=Func.ParamHint[IndexParam]
end;

function TunFunctions.GetInternalFuncName(const Index: Integer): string;
var Func: TunFunction;
begin
 Func:=FListFunctions[Index];
 Result:=Func.InternalFuncName;
end;

function TunFunctions.TranslateName(const AName: string): string;
var I: Integer;
    Func: TunFunction;
    isOk: boolean;
begin
 isOk:=false;
 for I:=0 to FListFunctions.Count-1 do
  begin
   Func:=FListFunctions[I];
   if Func.FuncName = AName then
    begin
     Result:=Func.InternalFuncName;
     isOk:=true;
     break;
    end;
  end;
 if not isOk then
  raise EunCalckError.Create(ERROR_DONT_FIND_FUNCTION);
end;

function TunFunctions.IndexByName(const AName: string): Integer;
var FuncName: string;
begin
 FuncName:=AName;
 FuncName[1]:=' ';
 Result:=StrToInt(Trim(FuncName));
end;

function TunFunctions.GetLikeFuncName(const Index: Integer): string;
var Func: TunFunction;
begin
 Func:=FListFunctions[Index];
 Result:=Func.LikeFuncName;
end;

{ TVersionName }

constructor TVersionName.Create;
begin
  inherited;
end;

destructor TVersionName.Destroy;
begin
  inherited;
end;

function TVersionName.Execute: variant;
begin
 Result:='TunCalck 4.0 Copyright 1986 - 2001. Programmer Bannikov N. A.';
end;

function TVersionName.GetFuncName: string;
begin
 Result:='VERSION';
end;

function TVersionName.GetHint: string;
begin
 Result:=STR_153;
end;

function TVersionName.GetLikeFuncName: string;
begin
 Result:='Version';
end;

function TVersionName.GetParamCount: Integer;
begin
 Result:=0;
end;

function TVersionName.GetParamHint(const Index: Integer): string;
begin
 Result:=DONT_PARAMETRS;
end;

{ TunForCommand }

constructor TunForCommand.Create;
begin
  inherited;
end;

destructor TunForCommand.Destroy;
begin
  inherited;
end;

function TunForCommand.Execute: variant;
var Prm: Variant;
    I: Integer;
    Fors: TForParams;
    isOk: boolean;
begin
 Result:=false;
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FCount:=Integer(Prm);
   FOnGetParam(Prm);
   FLabel:=AnsiUpperCase(string(Prm));
   isOk:=false;
   for I:=0 to Owner.AListFors.Count-1 do
    begin
     Fors:=Owner.AListFors[I];
     if Fors.LabelName = FLabel then
      begin
       Fors.Count:=FCount;
       isOk:=true;
       break;
      end;
    end;
   if not isOk then
    begin
     Fors:=TForParams.Create;
     Owner.AListFors.Add(Fors);
     Fors.LabelName:=FLabel;
     Fors.Count:=FCount;
    end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
 Result:=true;
end;

function TunForCommand.GetFuncName: string;
begin
 Result:='FOR';
end;

function TunForCommand.GetHint: string;
begin
 Result:=STR_154+' ENDFOR. FOR(LabelName: string, Count: Integer)';
end;

function TunForCommand.GetLikeFuncName: string;
begin
 Result:='for';
end;

function TunForCommand.GetParamCount: Integer;
begin
 Result:=2;
end;

function TunForCommand.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_155;
  1: Result:=STR_156;
 end;
end;

{ TEndForCommand }

constructor TEndForCommand.Create;
begin
  inherited;
end;

destructor TEndForCommand.Destroy;
begin
  inherited;
end;

function TEndForCommand.Execute: variant;
var Prm: Variant;
    Fors: TForParams;
    I: Integer;
    isOk: boolean;
    Poz: Integer;
    Stalker: TunStalker;
begin
 Result:=false;
 Stalker:=Owner.AStalker;
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FLabelName:=AnsiUpperCase(string(Prm));
   isOk:=false;
   for I:=0 to Owner.AListFors.Count-1 do
    begin
     Fors:=Owner.AListFors[I];
     if Fors.LabelName = FLabelName then
      begin
       Fors.Count:=Fors.Count-1;
       if Fors.Count > 0 then
        begin
         Poz:=Owner.ACompiler.FindString(FLabelName);
         if Poz > 0 then
          begin
           Owner.ACompiler.Position:=Poz;
           Stalker.GetTuken;
          end
         else
          raise EunCalckError.Create(ERROR_DONT_FIND_LABEL+FLabelName);
        end;
       isOk:=true;
       break;
      end;
    end;
   if not isOk then
    raise EunCalckError.Create(ERROR_DONT_FIND_LABEL_END_FOR+FLabelName);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
 Result:=true;
end;

function TEndForCommand.GetFuncName: string;
begin
 Result:='ENDFOR';
end;

function TEndForCommand.GetHint: string;
begin
 Result:=STR_157+' ENDFOR(LabelName: string)';
end;

function TEndForCommand.GetLikeFuncName: string;
begin
 Result:='EndFor';
end;

function TEndForCommand.GetParamCount: Integer;
begin
 Result:=1;
end;

function TEndForCommand.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_158;
end;

{ TIfCommand }

constructor TIfCommand.Create;
begin
  inherited;
end;

destructor TIfCommand.Destroy;
begin
  inherited;
end;

function TIfCommand.Execute: variant;
var Prm: Variant;
    Poz: Integer;
    Stalker: TunStalker;
begin
 Result:=false;
 if Assigned(FOnGetParam) then
  begin
   Stalker:=Owner.AStalker;
   FOnGetParam(Prm);
   FLabelFalse:=AnsiUpperCase(string(Prm));
   FOnGetParam(Prm);
   FLabelTrue:=AnsiUpperCase(string(Prm));
   FOnGetParam(Prm);
   FisTrue:=Boolean(Prm);
   if FisTrue then
    begin
     Poz:=Owner.ACompiler.FindString(FLabelTrue);
     if Poz > 0 then
      begin
       Owner.ACompiler.Position:=Poz;
       Stalker.GetTuken;
      end
     else
      raise EunCalckError.Create(ERROR_DONT_FIND_LABEL+FLabelTrue);
    end
   else
    begin
     Poz:=Owner.ACompiler.FindString(FLabelFalse);
     if Poz > 0 then
      begin
       Owner.ACompiler.Position:=Poz;
       Stalker.GetTuken;
      end
     else
      raise EunCalckError.Create(ERROR_DONT_FIND_LABEL+FLabelFalse);
    end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
 Result:=true;
end;

function TIfCommand.GetFuncName: string;
begin
 Result:='IF';
end;

function TIfCommand.GetHint: string;
begin
 Result:=STR_159+' IF(IfResult: boolean, LabelTrue, LabelFalse: string)';
end;

function TIfCommand.GetLikeFuncName: string;
begin
 Result:='if';
end;

function TIfCommand.GetParamCount: Integer;
begin
 Result:=3;
end;

function TIfCommand.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_160;
  1: Result:=STR_161;
  2: Result:=STR_162;
 end;
end;

{ TGoToCommand }

constructor TGoToCommand.Create;
begin
  inherited;
end;

destructor TGoToCommand.Destroy;
begin
  inherited;
end;

function TGoToCommand.Execute: variant;
var Prm: Variant;
    Poz: Integer;
    Stalker: TunStalker;
begin
 Result:=false;
 Stalker:=Owner.AStalker;
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FLabel:=AnsiUpperCase(string(Prm));
   Poz:=Owner.ACompiler.FindString(FLabel);
   if Poz > 0 then
    begin
     Owner.ACompiler.Position:=Poz;
     Stalker.GetTuken;
    end
   else
    raise EunCalckError.Create(ERROR_DONT_FIND_LABEL+FLabel);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
 Result:=true;
end;

function TGoToCommand.GetFuncName: string;
begin
 Result:='GOTO';
end;

function TGoToCommand.GetHint: string;
begin
 Result:=STR_9+' GOTO(LabelName: string)';
end;

function TGoToCommand.GetLikeFuncName: string;
begin
 Result:='GoTo';
end;

function TGoToCommand.GetParamCount: Integer;
begin
 Result:=1;
end;

function TGoToCommand.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_10;
end;

{ TDateFunc }

constructor TDateFunc.Create;
begin
  inherited;
end;

destructor TDateFunc.Destroy;
begin
  inherited;
end;

function TDateFunc.Execute: variant;
begin
 Result:=Date;
end;

function TDateFunc.GetFuncName: string;
begin
 Result:='DATE';
end;

function TDateFunc.GetHint: string;
begin
 Result:=STR_11+' DATE: TDateTime';
end;

function TDateFunc.GetLikeFuncName: string;
begin
 Result:='Date';
end;

function TDateFunc.GetParamCount: Integer;
begin
 Result:=0;
end;

function TDateFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=DONT_PARAMETRS;
end;

{ TTimeFunc }

constructor TTimeFunc.Create;
begin
  inherited;
end;

destructor TTimeFunc.Destroy;
begin
  inherited;
end;

function TTimeFunc.Execute: variant;
begin
 Result:=Time;
end;

function TTimeFunc.GetFuncName: string;
begin
 Result:='TIME';
end;

function TTimeFunc.GetHint: string;
begin
 Result:=STR_12+' TIME: TDateTime';
end;

function TTimeFunc.GetLikeFuncName: string;
begin
 Result:='Time';
end;

function TTimeFunc.GetParamCount: Integer;
begin
 Result:=0;
end;

function TTimeFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=DONT_PARAMETRS;
end;

{ TDateTimeFunc }

constructor TDateTimeFunc.Create;
begin
  inherited;
end;

destructor TDateTimeFunc.Destroy;
begin
  inherited;
end;

function TDateTimeFunc.Execute: variant;
begin
 Result:=Now;
end;

function TDateTimeFunc.GetFuncName: string;
begin
 Result:='NOW';
end;

function TDateTimeFunc.GetHint: string;
begin
 Result:=STR_13+' NOW: TDateTime';
end;

function TDateTimeFunc.GetLikeFuncName: string;
begin
 Result:='Now';
end;

function TDateTimeFunc.GetParamCount: Integer;
begin
 Result:=0;
end;

function TDateTimeFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=DONT_PARAMETRS;
end;

{ TLengthFunc }

constructor TLengthFunc.Create;
begin
  inherited;
end;

destructor TLengthFunc.Destroy;
begin
  inherited;
end;

function TLengthFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FStr:=string(Prm);
   Result:=Length(FStr)
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TLengthFunc.GetFuncName: string;
begin
 Result:='LENGTH';
end;

function TLengthFunc.GetHint: string;
begin
 Result:=STR_14+' LENGTH(Str: string): Integer';
end;

function TLengthFunc.GetLikeFuncName: string;
begin
 Result:='Length';
end;

function TLengthFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TLengthFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_15;
end;

{ TStrToFloat }

constructor TStrToFloat.Create;
begin
  inherited;
end;

destructor TStrToFloat.Destroy;
begin
  inherited;
end;

function TStrToFloat.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FStr:=string(Prm);
   try
    AOldDecimalSeparator:= FormatSettings.DecimalSeparator;
    FormatSettings.DecimalSeparator:=ADecimalSeparator;
    Result:=StrToFloat(FStr);
   finally
    FormatSettings.DecimalSeparator:=AOldDecimalSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TStrToFloat.GetFuncName: string;
begin
 Result:='STRTOFLOAT';
end;

function TStrToFloat.GetHint: string;
begin
 Result:=STR_16+' STRTOFLOAT(Str: string): Extended';
end;

function TStrToFloat.GetLikeFuncName: string;
begin
 Result:='StrToFloat';
end;

function TStrToFloat.GetParamCount: Integer;
begin
 Result:=1;
end;

function TStrToFloat.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_17;
end;

{ TFloatToStr }

constructor TFloatToStr.Create;
begin
  inherited;

end;

destructor TFloatToStr.Destroy;
begin
  inherited;

end;

function TFloatToStr.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   try
    AOldDecimalSeparator:=FormatSettings.DecimalSeparator;
    FormatSettings.DecimalSeparator:=ADecimalSeparator;
    Result:=string(Prm);
   finally
    FormatSettings.DecimalSeparator:=AOldDecimalSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TFloatToStr.GetFuncName: string;
begin
 Result:='FLOATTOSTR';
end;

function TFloatToStr.GetHint: string;
begin
 Result:=STR_18+' FLOATTOSTR(Val: Extended): string';
end;

function TFloatToStr.GetLikeFuncName: string;
begin
 Result:='FloatToStr';
end;

function TFloatToStr.GetParamCount: Integer;
begin
 Result:=1;
end;

function TFloatToStr.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_19;
end;

{ TDateToStrFunc }

constructor TDateToStrFunc.Create;
begin
  inherited;
end;

destructor TDateToStrFunc.Destroy;
begin
  inherited;
end;

function TDateToStrFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   try
    AOldDateSeparator:=FormatSettings.DateSeparator;
    FormatSettings.DateSeparator:=ADateSeparator;
    Result:=DateToStr(Prm);
   finally
    FormatSettings.DateSeparator:=AOldDateSeparator;
   end; 
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDateToStrFunc.GetFuncName: string;
begin
 Result:='DATETOSTR';
end;

function TDateToStrFunc.GetHint: string;
begin
 Result:=STR_20+' DATETOSTR(D: TDateTime): string';
end;

function TDateToStrFunc.GetLikeFuncName: string;
begin
 Result:='DateToStr';
end;

function TDateToStrFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TDateToStrFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_21;
end;

{ TStrToDateFunc }

constructor TStrToDateFunc.Create;
begin
  inherited;
end;

destructor TStrToDateFunc.Destroy;
begin
  inherited;
end;

function TStrToDateFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   try
    AOldDateSeparator:=FormatSettings.DateSeparator;
    FormatSettings.DateSeparator:=ADateSeparator;
    Result:=StrToDate(Prm);
   finally
    FormatSettings.DateSeparator:=AOldDateSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TStrToDateFunc.GetFuncName: string;
begin
 Result:='STRTODATE';
end;

function TStrToDateFunc.GetHint: string;
begin
 Result:=STR_22+' STRTODATE(Str: string): TDateTime';
end;

function TStrToDateFunc.GetLikeFuncName: string;
begin
 Result:='StrToDate';
end;

function TStrToDateFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TStrToDateFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_23;
end;

{ TTimeToStrFunc }

constructor TTimeToStrFunc.Create;
begin
  inherited;
end;

destructor TTimeToStrFunc.Destroy;
begin
  inherited;
end;

function TTimeToStrFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   try
    AOldTimeSeparator:=FormatSettings.TimeSeparator;
    FormatSettings.TimeSeparator:=ATimeSeparator;
    Result:=TimeToStr(Prm);
   finally
    FormatSettings.TimeSeparator:=AOldTimeSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TTimeToStrFunc.GetFuncName: string;
begin
 Result:='TIMETOSTR';
end;

function TTimeToStrFunc.GetHint: string;
begin
 Result:=STR_25+' TIMETOSTR(T: TDateTime): string';
end;

function TTimeToStrFunc.GetLikeFuncName: string;
begin
 Result:='TimeToStr';
end;

function TTimeToStrFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TTimeToStrFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_26;
end;

{ TStrToTimeFunc }

constructor TStrToTimeFunc.Create;
begin
  inherited;
end;

destructor TStrToTimeFunc.Destroy;
begin
  inherited;
end;

function TStrToTimeFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   try
    AOldTimeSeparator:=FormatSettings.TimeSeparator;
    FormatSettings.TimeSeparator:=ATimeSeparator;
    Result:=StrToTime(Prm);
   finally
    FormatSettings.TimeSeparator:=AOldTimeSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TStrToTimeFunc.GetFuncName: string;
begin
 Result:='STRTOTIME';
end;

function TStrToTimeFunc.GetHint: string;
begin
 Result:=STR_27+' STRTOTIME(Str: string): TDateTime';
end;

function TStrToTimeFunc.GetLikeFuncName: string;
begin
 Result:='StrToTime';
end;

function TStrToTimeFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TStrToTimeFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_28;
end;

{ TDateTimeToStr }

constructor TDateTimeToStr.Create;
begin
  inherited;
end;

destructor TDateTimeToStr.Destroy;
begin
  inherited;
end;        

function TDateTimeToStr.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   try
    AOldTimeSeparator:=FormatSettings.TimeSeparator;
    AOldDateSeparator:=FormatSettings.DateSeparator;
    FormatSettings.TimeSeparator:=ATimeSeparator;
    FormatSettings.DateSeparator:=ADateSeparator;
    Result:=DateTimeToStr(Prm);
   finally
    FormatSettings.TimeSeparator:=AOldTimeSeparator;
    FormatSettings.DateSeparator:=AOldDateSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDateTimeToStr.GetFuncName: string;
begin
 Result:='DATETIMETOSTR';
end;

function TDateTimeToStr.GetHint: string;
begin
 Result:=STR_29+' DATETIMETOSTR(DT: TDateTime): string';
end;

function TDateTimeToStr.GetLikeFuncName: string;
begin
 Result:='DateTimeToStr';
end;

function TDateTimeToStr.GetParamCount: Integer;
begin
 Result:=1;
end;

function TDateTimeToStr.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_30;
end;

{ TStrToDateTime }

constructor TStrToDateTime.Create;
begin
  inherited;
end;

destructor TStrToDateTime.Destroy;
begin
  inherited;
end;

function TStrToDateTime.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   try
    AOldTimeSeparator:=FormatSettings.TimeSeparator;
    AOldDateSeparator:=FormatSettings.DateSeparator;
    FormatSettings.TimeSeparator:=ATimeSeparator;
    FormatSettings.DateSeparator:=ADateSeparator;
    Result:=StrToDateTime(Prm);
   finally
    FormatSettings.TimeSeparator:=AOldTimeSeparator;
    FormatSettings.DateSeparator:=AOldDateSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TStrToDateTime.GetFuncName: string;
begin
 Result:='STRTODATETIME';
end;

function TStrToDateTime.GetHint: string;
begin
 Result:=STR_31+' STRTODATETIME(Str: string): TDateTime';
end;

function TStrToDateTime.GetLikeFuncName: string;
begin
 Result:='StrToDateTime';
end;

function TStrToDateTime.GetParamCount: Integer;
begin
 Result:=1;
end;

function TStrToDateTime.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_32;
end;

{ TFormatFloatFunc }

constructor TFormatFloatFunc.Create;
begin
  inherited;
end;

destructor TFormatFloatFunc.Destroy;
begin
  inherited;
end;

function TFormatFloatFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FValue:=Extended(Prm);
   FOnGetParam(Prm);
   FMaska:=String(Prm);
   try
    AOldDecimalSeparator:=FormatSettings.DecimalSeparator;
    FormatSettings.DecimalSeparator:=ADecimalSeparator;
    Result:=FormatFloat(FMaska, FValue);
   finally
    FormatSettings.DecimalSeparator:=AOldDecimalSeparator;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TFormatFloatFunc.GetFuncName: string;
begin
 Result:='FORMATFLOAT';
end;

function TFormatFloatFunc.GetHint: string;
begin
 Result:=STR_33+' Mask. FORMATFLOAT(Mask: string, Value: Extended): string';
end;

function TFormatFloatFunc.GetLikeFuncName: string;
begin
 Result:='FormatFloat';
end;

function TFormatFloatFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TFormatFloatFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_35;
  1: Result:=STR_36;
 end;
end;

{ TLTrimFunc }

constructor TLTrimFunc.Create;
begin
  inherited;
end;

destructor TLTrimFunc.Destroy;
begin
  inherited;
end;

function TLTrimFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=TrimLeft(Prm);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TLTrimFunc.GetFuncName: string;
begin
  Result:='TRIMLEFT';
end;

function TLTrimFunc.GetHint: string;
begin
 Result:=STR_37+' TRIMLEFT(Str: string): string';
end;

function TLTrimFunc.GetLikeFuncName: string;
begin
 Result:='TrimLeft';
end;

function TLTrimFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TLTrimFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_38;
end;

{ TRTrimFunc }

constructor TRTrimFunc.Create;
begin
  inherited;
end;

destructor TRTrimFunc.Destroy;
begin
  inherited;
end;

function TRTrimFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=TrimRight(Prm);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TRTrimFunc.GetFuncName: string;
begin
 Result:='TRIMRIGHT';
end;

function TRTrimFunc.GetHint: string;
begin
 Result:=STR_39+' TRIMRIGHT(Str: string): string';
end;

function TRTrimFunc.GetLikeFuncName: string;
begin
 Result:='TrimRight';
end;

function TRTrimFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TRTrimFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_40;
end;

{ TTrimFunc }

constructor TTrimFunc.Create;
begin
  inherited;
end;

destructor TTrimFunc.Destroy;
begin
  inherited;
end;

function TTrimFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=Trim(Prm);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TTrimFunc.GetFuncName: string;
begin
 Result:='TRIM';
end;

function TTrimFunc.GetHint: string;
begin
 Result:=STR_41+' TRIM(Str: string): string';
end;

function TTrimFunc.GetLikeFuncName: string;
begin
 Result:='Trim';
end;

function TTrimFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TTrimFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_42;
end;

{ TFracFunc }

constructor TFracFunc.Create;
begin
  inherited;
end;

destructor TFracFunc.Destroy;
begin
  inherited;
end;

function TFracFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Val:=Extended(Prm);
   Result:=Frac(Val);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TFracFunc.GetFuncName: string;
begin
 Result:='FRAC';
end;

function TFracFunc.GetHint: string;
begin
 Result:=STR_43+' FRAC(Value: Extended): Extended';
end;

function TFracFunc.GetLikeFuncName: string;
begin
 Result:='Frac';
end;

function TFracFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TFracFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TIntFunc }

constructor TIntFunc.Create;
begin
  inherited;
end;

destructor TIntFunc.Destroy;
begin
  inherited;
end;

function TIntFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Val:=Extended(Prm);
   Result:=Int(Val);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TIntFunc.GetFuncName: string;
begin
 Result:='INT';
end;

function TIntFunc.GetHint: string;
begin
 Result:=STR_45+' INT(Value: Extended): Integer';
end;

function TIntFunc.GetLikeFuncName: string;
begin
 Result:='Int';
end;

function TIntFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TIntFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TRoundFunc }

constructor TRoundFunc.Create;
begin
  inherited;
end;

destructor TRoundFunc.Destroy;
begin
  inherited;
end;

function TRoundFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FCount:=Integer(Prm);
   FOnGetParam(Prm);
   FFracVal:=Extended(Prm);
   FIntVal:=Trunc(FFracVal);
   FFracVal:=Frac(FFracVal);
   FBase:=IntPower(10, FCount);
   FFracVal:=FFracVal*FBase;
   FFracVal:=Round(FFracVal);
   FFracVal:=FFracVal/FBase;
   Result:=FIntVal+FFracVal;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TRoundFunc.GetFuncName: string;
begin
 Result:='ROUND';
end;

function TRoundFunc.GetHint: string;
begin
 Result:=STR_46+' ROUND(X: Extended; Y: Integer): Extended';
end;

function TRoundFunc.GetLikeFuncName: string;
begin
 Result:='Round';
end;

function TRoundFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TRoundFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_47;
  1: Result:=STR_48;
 end;
end;

{ TABSFunc }

constructor TABSFunc.Create;
begin
  inherited;
end;

destructor TABSFunc.Destroy;
begin
  inherited;
end;

function TABSFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=Extended(Prm);
   Result:=Abs(FVal);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TABSFunc.GetFuncName: string;
begin
 Result:='ABS';
end;

function TABSFunc.GetHint: string;
begin
 Result:=STR_49+' ABS(Value: Extended): Extended';
end;

function TABSFunc.GetLikeFuncName: string;
begin
 Result:='Abs';
end;

function TABSFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TABSFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TMaxFunc }

constructor TMaxFunc.Create;
begin
  inherited;
end;

destructor TMaxFunc.Destroy;
begin
  inherited;
end;

function TMaxFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal1:=Extended(Prm);
   FOnGetParam(Prm);
   FVal2:=Extended(Prm);
   Result:=Max(FVal1, FVal2);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TMaxFunc.GetFuncName: string;
begin
 Result:='MAX';
end;

function TMaxFunc.GetHint: string;
begin
 Result:=STR_50+' MAX(Value1, Value2: Extended): Extended';
end;

function TMaxFunc.GetLikeFuncName: string;
begin
 Result:='Max';
end;

function TMaxFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TMaxFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TMinFunc }

constructor TMinFunc.Create;
begin
  inherited;
end;

destructor TMinFunc.Destroy;
begin
  inherited;
end;

function TMinFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal1:=Extended(Prm);
   FOnGetParam(Prm);
   FVal2:=Extended(Prm);
   Result:=Min(FVal1, FVal2);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TMinFunc.GetFuncName: string;
begin
 Result:='MIN';
end;

function TMinFunc.GetHint: string;
begin
 Result:=STR_51+' MAX(Value1, Value2: Extended): Extended';
end;

function TMinFunc.GetLikeFuncName: string;
begin
 Result:='Min';
end;

function TMinFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TMinFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TSQRFunc }

constructor TSQRFunc.Create;
begin
  inherited;
end;

destructor TSQRFunc.Destroy;
begin
  inherited;
end;

function TSQRFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=SQR(Extended(Prm));
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TSQRFunc.GetFuncName: string;
begin
 Result:='SQR';
end;

function TSQRFunc.GetHint: string;
begin
 Result:=STR_52+' SQR(Value: Extended): Extended';
end;

function TSQRFunc.GetLikeFuncName: string;
begin
 Result:='Sqr';
end;

function TSQRFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TSQRFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TSQRTFunc }

constructor TSQRTFunc.Create;
begin
  inherited;
end;

destructor TSQRTFunc.Destroy;
begin
  inherited;
end;

function TSQRTFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=SQRT(Extended(Prm));
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TSQRTFunc.GetFuncName: string;
begin
 Result:='SQRT';
end;

function TSQRTFunc.GetHint: string;
begin
 Result:=STR_53+' SQRT(Value: Extended): Extended';
end;

function TSQRTFunc.GetLikeFuncName: string;
begin
 Result:='Sqrt';
end;

function TSQRTFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TSQRTFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TPowerFunc }

constructor TPowerFunc.Create;
begin
  inherited;
end;

destructor TPowerFunc.Destroy;
begin
  inherited;
end;

function TPowerFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FExponent:=Extended(Prm);
   FOnGetParam(Prm);
   FBase:=Extended(Prm);
   Result:=Power(FBase, FExponent);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TPowerFunc.GetFuncName: string;
begin
 Result:='POWER';
end;

function TPowerFunc.GetHint: string;
begin
 Result:=STR_54+' POWER(X, Y: Extended): Extended';
end;

function TPowerFunc.GetLikeFuncName: string;
begin
 Result:='Power';
end;

function TPowerFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TPowerFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_55;
  1: Result:=STR_56;
 end;
end;

{ TSinFunc }

constructor TSinFunc.Create;
begin
  inherited;
end;

destructor TSinFunc.Destroy;
begin
  inherited;
end;

function TSinFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=Sin(Extended(Prm));
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TSinFunc.GetFuncName: string;
begin
 Result:='SIN';
end;

function TSinFunc.GetHint: string;
begin
 Result:=STR_57+' SIN(Value: Extended): Extended. Value '+STR_58;
end;

function TSinFunc.GetLikeFuncName: string;
begin
 Result:='Sin';
end;

function TSinFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TSinFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_59;
end;

{ TCosFunc }

constructor TCosFunc.Create;
begin
  inherited;
end;

destructor TCosFunc.Destroy;
begin
  inherited;
end;

function TCosFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=Cos(Extended(Prm));
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TCosFunc.GetFuncName: string;
begin
 Result:='COS';
end;

function TCosFunc.GetHint: string;
begin
 Result:=STR_60+' COS(Value: Extended): Extended. Value '+STR_58;
end;

function TCosFunc.GetLikeFuncName: string;
begin
 Result:='Cos';
end;

function TCosFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TCosFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_59;
end;

{ TTanFunc }

constructor TTanFunc.Create;
begin
  inherited;
end;

destructor TTanFunc.Destroy;
begin
  inherited;
end;

function TTanFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=Tan(Extended(Prm));
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TTanFunc.GetFuncName: string;
begin
 Result:='TAN';
end;

function TTanFunc.GetHint: string;
begin
 Result:=STR_61+' TAN(Value: Extended): Extended. Value '+STR_58;
end;

function TTanFunc.GetLikeFuncName: string;
begin
 Result:='Tan';
end;

function TTanFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TTanFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_59;
end;

{ TArcTanFunc }

constructor TArcTanFunc.Create;
begin
  inherited;
end;

destructor TArcTanFunc.Destroy;
begin
  inherited;
end;

function TArcTanFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Result:=ArcTan(Extended(Prm));
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TArcTanFunc.GetFuncName: string;
begin
 Result:='ARCTAN';
end;

function TArcTanFunc.GetHint: string;
begin
 Result:=STR_62+' COS(Value: Extended): Extended.';
end;

function TArcTanFunc.GetLikeFuncName: string;
begin
 Result:='ArcTan';
end;

function TArcTanFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TArcTanFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_44;
end;

{ TProcentFunc }

constructor TProcentFunc.Create;
begin
  inherited;
end;

destructor TProcentFunc.Destroy;
begin
  inherited;
end;

function TProcentFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FPrc:=Extended(Prm);
   FOnGetParam(Prm);
   FVal:=Extended(Prm);
   Result:=FPrc*FVal/100;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TProcentFunc.GetFuncName: string;
begin
 Result:='PROCENT';
end;

function TProcentFunc.GetHint: string;
begin
 Result:=STR_63+' PROCENT(X, Y: Extended): Extended';
end;

function TProcentFunc.GetLikeFuncName: string;
begin
 Result:='Procent';
end;

function TProcentFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TProcentFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_44;
  1: Result:=STR_64;
 end;
end;

{ TAddProcentFunc }

constructor TAddProcentFunc.Create;
begin
  inherited;
end;

destructor TAddProcentFunc.Destroy;
begin
  inherited;
end;

function TAddProcentFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FPrc:=Extended(Prm);
   FOnGetParam(Prm);
   FVal:=Extended(Prm);
   Result:=FPrc*FVal/100+FVal;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TAddProcentFunc.GetFuncName: string;
begin
 Result:='ADDPROCENT';
end;

function TAddProcentFunc.GetHint: string;
begin
 Result:=STR_65+' ADDPROCENT(X, Y: Extended): Extended';
end;

function TAddProcentFunc.GetLikeFuncName: string;
begin
 Result:='AddProcent';
end;

function TAddProcentFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TAddProcentFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_44;
  1: Result:=STR_64;
 end;
end;

{ TIncludeProcentFunc }

constructor TIncludeProcentFunc.Create;
begin
  inherited;
end;

destructor TIncludeProcentFunc.Destroy;
begin
  inherited;
end;

function TIncludeProcentFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FPrc:=Extended(Prm);
   FOnGetParam(Prm);
   FVal:=Extended(Prm);
   Result:=FPrc/(FVal/100);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TIncludeProcentFunc.GetFuncName: string;
begin
 Result:='INCLUDEPROCENT';
end;

function TIncludeProcentFunc.GetHint: string;
begin
 Result:=STR_66+' INCLUDEPROCENT(X, Y: Extended): Extended';
end;

function TIncludeProcentFunc.GetLikeFuncName: string;
begin
 Result:='IncludeProcent';
end;

function TIncludeProcentFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TIncludeProcentFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_44;
  1: Result:=STR_64;
 end;
end;

{ TRandomFunc }

constructor TRandomFunc.Create;
begin
  inherited;
end;

destructor TRandomFunc.Destroy;
begin
  inherited;
end;

function TRandomFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FRange:=Integer(Prm);
   Result:=Random(FRange);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TRandomFunc.GetFuncName: string;
begin
 Result:='RANDOM';
end;

function TRandomFunc.GetHint: string;
begin
 Result:=STR_67+' Range. RANDOM(Range: Extended): Extended';
end;

function TRandomFunc.GetLikeFuncName: string;
begin
 Result:='Random';
end;

function TRandomFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TRandomFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_68;
end;

{ TLGFunc }

constructor TLGFunc.Create;
begin
  inherited;
end;

destructor TLGFunc.Destroy;
begin
  inherited;
end;

function TLGFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=Integer(Prm);
   Result:=Log10(FVal);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TLGFunc.GetFuncName: string;
begin
 Result:='LOG10';
end;

function TLGFunc.GetHint: string;
begin
 Result:=STR_69+' LOG10(X: Extended): Extended';
end;

function TLGFunc.GetLikeFuncName: string;
begin
 Result:='Log10';
end;

function TLGFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TLGFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_70;
end;

{ TLogFunc }

constructor TLogFunc.Create;
begin
  inherited;
end;

destructor TLogFunc.Destroy;
begin
  inherited;
end;

function TLogFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=Extended(Prm);
   FOnGetParam(Prm);
   FN:=Extended(Prm);
   Result:=LogN(FN, FVal);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TLogFunc.GetFuncName: string;
begin
 Result:='LOGN';
end;

function TLogFunc.GetHint: string;
begin
 Result:=STR_71+' LOGN(N, X: Extended): Extended';
end;

function TLogFunc.GetLikeFuncName: string;
begin
 Result:='Logn';
end;

function TLogFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TLogFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_72;
  1: Result:=STR_70;
 end;
end;

{ TUpperCaseFunc }

constructor TUpperCaseFunc.Create;
begin
  inherited;
end;

destructor TUpperCaseFunc.Destroy;
begin
  inherited;
end;

function TUpperCaseFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=string(Prm);
   Result:=AnsiUpperCase(FVal);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TUpperCaseFunc.GetFuncName: string;
begin
 Result:='UPPERCASE';
end;

function TUpperCaseFunc.GetHint: string;
begin
 Result:=STR_73+' UPPERCASE(Str: string): string';
end;

function TUpperCaseFunc.GetLikeFuncName: string;
begin
 Result:='UpperCase';
end;

function TUpperCaseFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TUpperCaseFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_74;
end;

{ TLoverCaseFunc }

constructor TLoverCaseFunc.Create;
begin
  inherited;
end;

destructor TLoverCaseFunc.Destroy;
begin
  inherited;
end;

function TLoverCaseFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=string(Prm);
   Result:=AnsiLowerCase(FVal);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TLoverCaseFunc.GetFuncName: string;
begin
 Result:='LOWERCASE';
end;

function TLoverCaseFunc.GetHint: string;
begin
 Result:=STR_75+' LOWERCASE(Str: string): string';
end;

function TLoverCaseFunc.GetLikeFuncName: string;
begin
 Result:='LowerCase';
end;

function TLoverCaseFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TLoverCaseFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_74;
end;

{ TCompareFunc }

constructor TCompareFunc.Create;
begin
  inherited;
end;

destructor TCompareFunc.Destroy;
begin
  inherited;
end;

function TCompareFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal2:=string(Prm);
   FOnGetParam(Prm);
   FVal1:=string(Prm);
   Result:=AnsiCompareStr(FVal1, FVal2);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TCompareFunc.GetFuncName: string;
begin
 Result:='COMPARESTR';
end;

function TCompareFunc.GetHint: string;
begin
 Result:=STR_76+' COMPARESTR(Str1, Str2: string): Integer';
end;

function TCompareFunc.GetLikeFuncName: string;
begin
 Result:='CompareStr';
end;

function TCompareFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TCompareFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_74;
end;

{ TCopyStrFunc }

constructor TCopyStrFunc.Create;
begin
  inherited;
end;

destructor TCopyStrFunc.Destroy;
begin
  inherited;
end;

function TCopyStrFunc.Execute: variant;
var Prm: Variant;
    I: Integer;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FCount:=Integer(Prm);
   FOnGetParam(Prm);
   FStart:=Integer(Prm);
   FOnGetParam(Prm);
   FVal:=string(Prm);
   Result:='';
   for I:=FStart to FStart+FCount-1 do
    begin
     if I > Length(FVal) then
      break;
     Result:=Result+FVal[I];
    end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TCopyStrFunc.GetFuncName: string;
begin
 Result:='COPYSTR';
end;

function TCopyStrFunc.GetHint: string;
begin
 Result:=STR_77+' Start. COPYSTR(Str: string, Start, Count: Integer): string';
end;

function TCopyStrFunc.GetLikeFuncName: string;
begin
 Result:='CopyStr';
end;

function TCopyStrFunc.GetParamCount: Integer;
begin
 Result:=3;
end;

function TCopyStrFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_74;
  1: Result:=STR_78;
  2: Result:=STR_79;
 end;
end;

{ TAnsiPos }

constructor TAnsiPos.Create;
begin
  inherited;
end;

destructor TAnsiPos.Destroy;
begin
  inherited;
end;

function TAnsiPos.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal2:=string(Prm);
   FOnGetParam(Prm);
   FVal1:=string(Prm);
   Result:=AnsiPos(FVal1, FVal2);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TAnsiPos.GetFuncName: string;
begin
 Result:='POS';
end;

function TAnsiPos.GetHint: string;
begin
 Result:=STR_80+' Str1. POS(Str1, Str2: string): Integer';
end;

function TAnsiPos.GetLikeFuncName: string;
begin
 Result:='Pos';
end;

function TAnsiPos.GetParamCount: Integer;
begin
 Result:=2;
end;

function TAnsiPos.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_74;
end;

{ TWrapTextFunc }

constructor TWrapTextFunc.Create;
begin
  inherited;
end;

destructor TWrapTextFunc.Destroy;
begin
  inherited;
end;

function TWrapTextFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FCount:=Integer(Prm);
   FOnGetParam(Prm);
   FVal:=string(Prm);
   Result:=WrapText(FVal, #13#10, ['.',' ',#9,'-'], FCount);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TWrapTextFunc.GetFuncName: string;
begin
 Result:='WRAPTEXT';
end;

function TWrapTextFunc.GetHint: string;
begin
 Result:=STR_81+' Count. WRAPTEXT(Str: string; Count: Integer): string';
end;

function TWrapTextFunc.GetLikeFuncName: string;
begin
 Result:='WrapText';
end;

function TWrapTextFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TWrapTextFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_74;
  1: Result:=STR_82;
 end;
end;

{ TStartYearFunc }

constructor TStartYearFunc.Create;
begin
  inherited;
end;

destructor TStartYearFunc.Destroy;
begin
  inherited;
end;

function TStartYearFunc.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   Result:=EncodeDate(Year, 1, 1);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TStartYearFunc.GetFuncName: string;
begin
 Result:='STARTYEAR';
end;

function TStartYearFunc.GetHint: string;
begin
 Result:=STR_83+' STARTYEAR(D: TDateTime): TDateTime';
end;

function TStartYearFunc.GetLikeFuncName: string;
begin
 Result:='StartYear';
end;

function TStartYearFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TStartYearFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TStartMonthFunc }

constructor TStartMonthFunc.Create;
begin
  inherited;
end;

destructor TStartMonthFunc.Destroy;
begin
  inherited;
end;

function TStartMonthFunc.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   Result:=EncodeDate(Year, Month, 1);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TStartMonthFunc.GetFuncName: string;
begin
 Result:='STARTMONTH';
end;

function TStartMonthFunc.GetHint: string;
begin
 Result:=STR_85+' STARTMONTH(D: TDateTime): TDateTime';
end;

function TStartMonthFunc.GetLikeFuncName: string;
begin
 Result:='StartMonth';
end;

function TStartMonthFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TStartMonthFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TStartQuarterFunc }

constructor TStartQuarterFunc.Create;
begin
  inherited;
end;

destructor TStartQuarterFunc.Destroy;
begin
  inherited;
end;

function TStartQuarterFunc.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   if Month > 9 then
    Month:=10
   else if Month > 6 then
    Month:=7
   else if Month > 3 then
    Month:=4
   else Month:=1;
   Result:=EncodeDate(Year, Month, 1);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TStartQuarterFunc.GetFuncName: string;
begin
 Result:='STARTQUARTER';
end;

function TStartQuarterFunc.GetHint: string;
begin
 Result:=STR_86+' STARTQUARTER(D: TDateTime): TDateTime';
end;

function TStartQuarterFunc.GetLikeFuncName: string;
begin
 Result:='StartQuarter';
end;

function TStartQuarterFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TStartQuarterFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TDayOfWeekFunc }

constructor TDayOfWeekFunc.Create;
begin
  inherited;
end;

destructor TDayOfWeekFunc.Destroy;
begin
  inherited;
end;

function TDayOfWeekFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   Result:=DayOfWeek(FVal);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDayOfWeekFunc.GetFuncName: string;
begin
  Result:='DAYOFWEEK';
end;

function TDayOfWeekFunc.GetHint: string;
begin
 Result:=STR_87+' D. DAYOFWEEK(D: TDateTime): TDateTime';
end;

function TDayOfWeekFunc.GetLikeFuncName: string;
begin
 Result:='DayOfWeek';
end;

function TDayOfWeekFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TDayOfWeekFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TIncMonthFunc }

constructor TIncMonthFunc.Create;
begin
  inherited;
end;

destructor TIncMonthFunc.Destroy;
begin
  inherited;
end;

function TIncMonthFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FCount:=Integer(Prm);
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   Result:=IncMonth(FVal, FCount);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TIncMonthFunc.GetFuncName: string;
begin
   Result:='INCMONTH';
end;

function TIncMonthFunc.GetHint: string;
begin
  Result:=STR_88+' D. INCMONTH(D: TDateTime; Count: Integer): TDateTime';
end;

function TIncMonthFunc.GetLikeFuncName: string;
begin
 Result:='IncMonth';
end;

function TIncMonthFunc.GetParamCount: Integer;
begin
 Result:=2;
end;

function TIncMonthFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_84;
  1: Result:=STR_89;
 end;
end;

{ TIsLeapYearFunc }

constructor TIsLeapYearFunc.Create;
begin
  inherited;
end;

destructor TIsLeapYearFunc.Destroy;
begin
  inherited;
end;

function TIsLeapYearFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=Integer(Prm);
   Result:=IsLeapYear(FVal);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TIsLeapYearFunc.GetFuncName: string;
begin
   Result:='ISLEAPYEAR';
end;

function TIsLeapYearFunc.GetHint: string;
begin
 Result:=STR_90+' ISLEAPYEAR(D: Integer): boolean';
end;

function TIsLeapYearFunc.GetLikeFuncName: string;
begin
 Result:='IsLeapYear';
end;

function TIsLeapYearFunc.GetParamCount: Integer;
begin
  Result:=1;
end;

function TIsLeapYearFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_91;
end;

{ TDaysInMonth }

constructor TDaysInMonth.Create;
begin
  inherited;
end;

destructor TDaysInMonth.Destroy;
begin
  inherited;
end;

function TDaysInMonth.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   case Month of
    1, 3, 5, 7, 8, 10, 12: Result:=31;
    2: begin
        if IsLeapYear(Year) then
         Result:=29
        else
         Result:=28;
       end;
    else Result:=30;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDaysInMonth.GetFuncName: string;
begin
   Result:='DAYSINMONTH';
end;

function TDaysInMonth.GetHint: string;
begin
 Result:=STR_92+' DAYSINMONTH(D: TDateTime): Integer';
end;

function TDaysInMonth.GetLikeFuncName: string;
begin
 Result:='DaysInMonth';
end;

function TDaysInMonth.GetParamCount: Integer;
begin
  Result:=1;
end;

function TDaysInMonth.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TDaysInYear }

constructor TDaysInYear.Create;
begin
  inherited;
end;

destructor TDaysInYear.Destroy;
begin
  inherited;
end;

function TDaysInYear.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   Year:=Year+1;
   Result:=EncodeDate(Year, Month, Day)-FVal;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDaysInYear.GetFuncName: string;
begin
   Result:='DAYSINYEAR';
end;

function TDaysInYear.GetHint: string;
begin
 Result:=STR_93+' DAYSINMONTH(D: TDateTime): Integer';
end;

function TDaysInYear.GetLikeFuncName: string;
begin
 Result:='DaysInYear';
end;

function TDaysInYear.GetParamCount: Integer;
begin
  Result:=1;
end;

function TDaysInYear.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TDateToYear }

constructor TDateToYear.Create;
begin
  inherited;
end;

destructor TDateToYear.Destroy;
begin
  inherited;
end;

function TDateToYear.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   Result:=Year;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDateToYear.GetFuncName: string;
begin
 Result:='DATETOYEAR';
end;

function TDateToYear.GetHint: string;
begin
 Result:=STR_94+' DATETODAY(T: TDateTime): Integer';
end;

function TDateToYear.GetLikeFuncName: string;
begin
 Result:='DateToYear';
end;

function TDateToYear.GetParamCount: Integer;
begin
 Result:=1;
end;

function TDateToYear.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TDateToDay }

constructor TDateToDay.Create;
begin
  inherited;
end;

destructor TDateToDay.Destroy;
begin
  inherited;
end;

function TDateToDay.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   Result:=Day;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDateToDay.GetFuncName: string;
begin
 Result:='DATETODAY';
end;

function TDateToDay.GetHint: string;
begin
 Result:=STR_95+' DATETODAY(T: TDateTime): Integer';
end;

function TDateToDay.GetLikeFuncName: string;
begin
 Result:='DateToDay';
end;

function TDateToDay.GetParamCount: Integer;
begin
 Result:=1;
end;

function TDateToDay.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TDateToMonth }

constructor TDateToMonth.Create;
begin
  inherited;
end;

destructor TDateToMonth.Destroy;
begin
  inherited;
end;

function TDateToMonth.Execute: variant;
var Prm: Variant;
    Year, Month, Day: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeDate(FVal, Year, Month, Day);
   Result:=Month;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TDateToMonth.GetFuncName: string;
begin
 Result:='DATETOMONTH';
end;

function TDateToMonth.GetHint: string;
begin
 Result:=STR_96+' DATETOMONTH(T: TDateTime): Integer';
end;

function TDateToMonth.GetLikeFuncName: string;
begin
 Result:='DateToMonth';
end;

function TDateToMonth.GetParamCount: Integer;
begin
 Result:=1;
end;

function TDateToMonth.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_84;
end;

{ TTimeToHour }

constructor TTimeToHour.Create;
begin
  inherited;
end;

destructor TTimeToHour.Destroy;
begin
  inherited;
end;

function TTimeToHour.Execute: variant;
var Prm: Variant;
    Hour, Min, Sec, MSec: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeTime(FVal, Hour, Min, Sec, MSec);
   Result:=Hour;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TTimeToHour.GetFuncName: string;
begin
 Result:='TIMETOHOUR';
end;

function TTimeToHour.GetHint: string;
begin
 Result:=STR_97+' TIMETOHOUR(T: TDateTime): Integer';
end;

function TTimeToHour.GetLikeFuncName: string;
begin
 Result:='TimeToHour';
end;

function TTimeToHour.GetParamCount: Integer;
begin
 Result:=1;
end;

function TTimeToHour.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_98;
end;

{ TTimeToMinute }

constructor TTimeToMinute.Create;
begin
  inherited;
end;

destructor TTimeToMinute.Destroy;
begin
  inherited;
end;

function TTimeToMinute.Execute: variant;
var Prm: Variant;
    Hour, Min, Sec, MSec: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeTime(FVal, Hour, Min, Sec, MSec);
   Result:=Min;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TTimeToMinute.GetFuncName: string;
begin
 Result:='TIMETOMIN';
end;

function TTimeToMinute.GetHint: string;
begin
 Result:=STR_99+' TIMETOMIN(T: TDateTime): Integer';
end;

function TTimeToMinute.GetLikeFuncName: string;
begin
 Result:='TimeToMin';
end;

function TTimeToMinute.GetParamCount: Integer;
begin
 Result:=1;
end;

function TTimeToMinute.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_98;
end;

{ TTimeToSec }

constructor TTimeToSec.Create;
begin
  inherited;
end;

destructor TTimeToSec.Destroy;
begin
  inherited;
end;

function TTimeToSec.Execute: variant;
var Prm: Variant;
    Hour, Min, Sec, MSec: Word;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FVal:=TDateTime(Prm);
   DecodeTime(FVal, Hour, Min, Sec, MSec);
   Result:=Sec;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TTimeToSec.GetFuncName: string;
begin
 Result:='TIMETOSEC';
end;

function TTimeToSec.GetHint: string;
begin
 Result:=STR_100+' TIMETOSEC(T: TDateTime): Integer';
end;

function TTimeToSec.GetLikeFuncName: string;
begin
 Result:='TimeToSec';
end;

function TTimeToSec.GetParamCount: Integer;
begin
 Result:=1;
end;

function TTimeToSec.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_98;
end;

{ TInputStringFunc }

constructor TInputStringFunc.Create;
begin
  inherited;
end;

destructor TInputStringFunc.Destroy;
begin
  inherited;
end;

function TInputStringFunc.Execute: variant;
var fInputString: TfInputString;
    Prm: Variant;
    OldStr: string;
begin
 if Assigned(FOnGetParam) then
  begin
   fInputString:=TfInputString.Create(nil);
   try
    FOnGetParam(Prm);
    fInputString.HelpIndex:=Integer(Prm);
    FOnGetParam(Prm);
    fInputString.eInputString.Text:=string(Prm);
    FOnGetParam(Prm);
    fInputString.lMessage.Caption:=string(Prm);
    FOnGetParam(Prm);
    fInputString.Caption:=string(Prm);
    OldStr:=fInputString.eInputString.Text;
    if fInputString.ShowModal = mrOk then
     begin
      Result:=fInputString.eInputString.Text;
     end
    else
     Result:=OldStr;
   finally
    fInputString.Free;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TInputStringFunc.GetFuncName: string;
begin
 Result:='INPUTSTRING';
end;

function TInputStringFunc.GetHint: string;
begin
 Result:=STR_101+' INPUTSTRING(Caption, Message, Value: string; HLP_ID: Integer): string';
end;

function TInputStringFunc.GetLikeFuncName: string;
begin
 Result:='InputString';
end;

function TInputStringFunc.GetParamCount: Integer;
begin
 Result:=4;
end;

function TInputStringFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_102;
  1: Result:=STR_103;
  2: Result:=STR_104;
  3: Result:=STR_105;
 end;
end;

{ TInputDateFunc }

constructor TInputDateFunc.Create;
begin
  inherited;
end;

destructor TInputDateFunc.Destroy;
begin
  inherited;
end;

function TInputDateFunc.Execute: variant;
var fInputDate: TfInputDate;
    Prm: Variant;
    OldStr: TDateTime;
begin
 if Assigned(FOnGetParam) then
  begin
   fInputDate:=TfInputDate.Create(nil);
   try
    AOldDateSeparator:=FormatSettings.DateSeparator;
    FormatSettings.DateSeparator:=ADateSeparator;
    FOnGetParam(Prm);
    fInputDate.HelpIndex:=Integer(Prm);
    FOnGetParam(Prm);
    fInputDate.mcInputDate.Date:=TDateTime(Prm);
    FOnGetParam(Prm);
    fInputDate.lMessage.Caption:=string(Prm);
    FOnGetParam(Prm);
    fInputDate.Caption:=string(Prm);
    OldStr:=fInputDate.mcInputDate.Date;
    if fInputDate.ShowModal = mrOk then
     begin
      Result:=fInputDate.mcInputDate.Date;
     end
    else
     Result:=OldStr;
   finally
    FormatSettings.DateSeparator:=AOldDateSeparator;
    fInputDate.Free;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TInputDateFunc.GetFuncName: string;
begin
 Result:='INPUTDATE';
end;

function TInputDateFunc.GetHint: string;
begin
 Result:=STR_106+' INPUTDATE(Caption, Message: string; Value: TDateTime; HLP_ID: Integer): TDateTime';
end;

function TInputDateFunc.GetLikeFuncName: string;
begin
 Result:='InputDate';
end;

function TInputDateFunc.GetParamCount: Integer;
begin
 Result:=4;
end;

function TInputDateFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_102;
  1: Result:=STR_103;
  2: Result:=STR_107;
  3: Result:=STR_105;
 end;
end;

{ TInputTimeFunc }

constructor TInputTimeFunc.Create;
begin
  inherited;
end;

destructor TInputTimeFunc.Destroy;
begin
  inherited;
end;

function TInputTimeFunc.Execute: variant;
var fInputTime: TfInputTime;
    Prm: Variant;
    OldStr: TDateTime;
begin
 if Assigned(FOnGetParam) then
  begin
   fInputTime:=TfInputTime.Create(nil);
   try
    AOldTimeSeparator:=FormatSettings.TimeSeparator;
    ATimeSeparator:=FormatSettings.TimeSeparator;
    FOnGetParam(Prm);
    fInputTime.HelpIndex:=Integer(Prm);
    FOnGetParam(Prm);
    fInputTime.DateTimePicker1.Time:=TDateTime(Prm);
    FOnGetParam(Prm);
    fInputTime.lMessage.Caption:=string(Prm);
    FOnGetParam(Prm);
    fInputTime.Caption:=string(Prm);
    OldStr:=fInputTime.DateTimePicker1.Time;
    if fInputTime.ShowModal = mrOk then
     begin
      Result:=fInputTime.DateTimePicker1.Time;
     end
    else
     Result:=OldStr;
   finally
    FormatSettings.TimeSeparator:=AOldTimeSeparator;
    fInputTime.Free;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TInputTimeFunc.GetFuncName: string;
begin
 Result:='INPUTTIME';
end;

function TInputTimeFunc.GetHint: string;
begin
 Result:=STR_108+' INPUTTIME(Caption, Message: string; Value: TDateTime; HLP_ID: Integer): TDateTime';
end;

function TInputTimeFunc.GetLikeFuncName: string;
begin
 Result:='InputTime';
end;

function TInputTimeFunc.GetParamCount: Integer;
begin
 Result:=4;
end;

function TInputTimeFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_102;
  1: Result:=STR_103;
  2: Result:=STR_109;
  3: Result:=STR_105;
 end;
end;

{ TInputDateTimeFunc }

constructor TInputDateTimeFunc.Create;
begin
  inherited;
end;

destructor TInputDateTimeFunc.Destroy;
begin
  inherited;
end;

function TInputDateTimeFunc.Execute: variant;
var fInputDateTime: TfInputDateTime;
    Prm: Variant;
    OldDate: TDateTime;
    OldTime: TDateTime;
begin
 if Assigned(FOnGetParam) then
  begin
   fInputDateTime:=TfInputDateTime.Create(nil);
   try
    AOldTimeSeparator:=FormatSettings.TimeSeparator;
    AOldDateSeparator:=FormatSettings.DateSeparator;
    FormatSettings.TimeSeparator:=ATimeSeparator;
    FormatSettings.DateSeparator:=ADateSeparator;
    FOnGetParam(Prm);
    fInputDateTime.HelpIndex:=Integer(Prm);
    FOnGetParam(Prm);
    fInputDateTime.DateTimePicker1.Date:=Trunc(TDateTime(Prm));
    fInputDateTime.DateTimePicker2.Time:=Frac(TDateTime(Prm));
    FOnGetParam(Prm);
    fInputDateTime.lMessage.Caption:=string(Prm);
    FOnGetParam(Prm);
    fInputDateTime.Caption:=string(Prm);
    OldDate:=Trunc(fInputDateTime.DateTimePicker1.Date);
    OldTime:=Frac(fInputDateTime.DateTimePicker2.Time);
    if fInputDateTime.ShowModal = mrOk then
     begin
      Result:=Trunc(fInputDateTime.DateTimePicker1.Date)+
        Frac(fInputDateTime.DateTimePicker2.Time);
     end
    else
     Result:=OldDate+OldTime;
   finally
    FormatSettings.TimeSeparator:=AOldTimeSeparator;
    FormatSettings.DateSeparator:=AOldDateSeparator;
    fInputDateTime.Free;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TInputDateTimeFunc.GetFuncName: string;
begin
 Result:='INPUTDATETIME';
end;

function TInputDateTimeFunc.GetHint: string;
begin
 Result:=STR_110+' INPUTDATETIME(Caption, Message: string; Value: TDateTime; HLP_ID: Integer): TDateTime';
end;

function TInputDateTimeFunc.GetLikeFuncName: string;
begin
 Result:='InputDateTime';
end;

function TInputDateTimeFunc.GetParamCount: Integer;
begin
 Result:=4;
end;

function TInputDateTimeFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_102;
  1: Result:=STR_103;
  2: Result:=STR_111;
  3: Result:=STR_105;
 end;
end;

{ TInputIntegerFunc }

constructor TInputIntegerFunc.Create;
begin
  inherited;
end;

destructor TInputIntegerFunc.Destroy;
begin
  inherited;
end;

function TInputIntegerFunc.Execute: variant;
var fInputIntegerDialog: TfInputIntegerDialog;
    Prm: Variant;
    OldStr: Integer;
begin
 if Assigned(FOnGetParam) then
  begin
   fInputIntegerDialog:=TfInputIntegerDialog.Create(nil);
   try
    FOnGetParam(Prm);
    fInputIntegerDialog.HelpIndex:=Integer(Prm);
    FOnGetParam(Prm);
    fInputIntegerDialog.SpinEdit1.Value:=Integer(Prm);
    FOnGetParam(Prm);
    fInputIntegerDialog.lMessage.Caption:=string(Prm);
    FOnGetParam(Prm);
    fInputIntegerDialog.Caption:=string(Prm);
    OldStr:=fInputIntegerDialog.SpinEdit1.Value;
    if fInputIntegerDialog.ShowModal = mrOk then
     begin
      Result:=fInputIntegerDialog.SpinEdit1.Value;
     end
    else
     Result:=OldStr;
   finally
    fInputIntegerDialog.Free;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TInputIntegerFunc.GetFuncName: string;
begin
 Result:='INPUTINTEGER';
end;

function TInputIntegerFunc.GetHint: string;
begin
 Result:=STR_112+' INPUTINTEGER(Caption, Message: string Value: Integer; HLP_ID: Integer): Integer';
end;

function TInputIntegerFunc.GetLikeFuncName: string;
begin
 Result:='InputInteger';
end;

function TInputIntegerFunc.GetParamCount: Integer;
begin
 Result:=4;
end;

function TInputIntegerFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_102;
  1: Result:=STR_103;
  2: Result:=STR_113;
  3: Result:=STR_105;
 end;
end;

{ TInputFloatFunc }

constructor TInputFloatFunc.Create;
begin
  inherited;
end;

destructor TInputFloatFunc.Destroy;
begin
  inherited;
end;

function TInputFloatFunc.Execute: variant;
var fInputExtendedDialog: TfInputExtendedDialog;
    Prm: Variant;
    OldStr: Extended;
begin
 if Assigned(FOnGetParam) then
  begin
   fInputExtendedDialog:=TfInputExtendedDialog.Create(nil);
   try
    ADecimalSeparator:=FormatSettings.TimeSeparator;
    FOnGetParam(Prm);
    fInputExtendedDialog.HelpIndex:=Integer(Prm);
    FOnGetParam(Prm);
    fInputExtendedDialog.eValue.Text:=FloatToStr(Extended(Prm));
    FOnGetParam(Prm);
    fInputExtendedDialog.lMessage.Caption:=string(Prm);
    FOnGetParam(Prm);
    fInputExtendedDialog.Caption:=string(Prm);
    OldStr:=StrToFloat(fInputExtendedDialog.eValue.Text);
    if fInputExtendedDialog.ShowModal = mrOk then
     begin
      Result:=StrToFloat(fInputExtendedDialog.eValue.Text);
     end
    else
     Result:=OldStr;
   finally
    FormatSettings.TimeSeparator:=ADecimalSeparator;
    fInputExtendedDialog.Free;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TInputFloatFunc.GetFuncName: string;
begin
 Result:='INPUTFLOAT';
end;

function TInputFloatFunc.GetHint: string;
begin
 Result:=STR_114+' INPUTFLOAT(Caption, Message: string; Value: Extended; HLP_ID: Integer): Extended';
end;

function TInputFloatFunc.GetLikeFuncName: string;
begin
 Result:='InputFloat';
end;

function TInputFloatFunc.GetParamCount: Integer;
begin
 Result:=4;
end;

function TInputFloatFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_102;
  1: Result:=STR_103;
  2: Result:=STR_115;
  3: Result:=STR_105;
 end;
end;

{ TShowMessageFunc }

constructor TShowMessageFunc.Create;
begin
  inherited;
end;

destructor TShowMessageFunc.Destroy;
begin
  inherited;
end;

function TShowMessageFunc.Execute: variant;
var Prm: Variant;
    msg: string;
    HlpPrm: Integer;
    TypeMsg: TMsgDlgType;
begin
 if Assigned(FOnGetParam) then
  begin
    FOnGetParam(Prm);
    HlpPrm:=Integer(Prm);
    FOnGetParam(Prm);
    TypeMsg:=TMsgDlgType(Prm);
    FOnGetParam(Prm);
    msg:=string(Prm);
    if  TypeMsg = mtConfirmation then
     Result:=MessageDlg(msg,  TypeMsg, [mbYes, mbNo], HlpPrm) = mrYes
    else
     Result:=MessageDlg(msg,  TypeMsg, [mbYes], HlpPrm) = mrYes;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TShowMessageFunc.GetFuncName: string;
begin
 Result:='SHOWMESSAGE';
end;

function TShowMessageFunc.GetHint: string;
begin
 Result:=STR_116+' SHOWMESSAGE(Caption: string; MessageType: Integer; HLP_ID: Integer): boolean';
end;

function TShowMessageFunc.GetLikeFuncName: string;
begin
 Result:='ShowMessage';
end;

function TShowMessageFunc.GetParamCount: Integer;
begin
 Result:=3;
end;

function TShowMessageFunc.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_117;
  1: Result:=STR_118+CLR+
     STR_119+CLR+
     STR_120+CLR+
     STR_121+CLR+
     STR_122+CLR+
     STR_123;
  2: Result:=STR_105;
 end;
end;

{ TShowDilog }

constructor TShowDilog.Create;
begin
  inherited;
end;

destructor TShowDilog.Destroy;
begin
  inherited;
end;

function TShowDilog.Execute: variant;
var fDialog: TfDialog;
    Prm: Variant;
begin
 Result:=false;
 if Assigned(FOnGetParam) then
  begin
   fDialog:=TfDialog.Create(nil);
   try
    FOnGetParam(Prm);
    fDialog.HelpIndex:=Integer(Prm);
    FOnGetParam(Prm);
    fDialog.lMessage.Caption:=string(Prm);
    FOnGetParam(Prm);
    fDialog.Caption:=string(Prm);
    Result:=fDialog.ShowModal = mrOk;
   finally
    fDialog.Free;
   end;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TShowDilog.GetFuncName: string;
begin
 Result:='SHOWDILOG';
end;

function TShowDilog.GetHint: string;
begin
 Result:=STR_124+' SHOWMESSAGE(Caption, Message: string; HLP_ID: Integer): boolean';
end;

function TShowDilog.GetParamCount: Integer;
begin
 Result:=3;
end;

function TShowDilog.GetLikeFuncName: string;
begin
 Result:='ShowDilog';
end;

function TShowDilog.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_102;
  1: Result:=STR_103;
  2: Result:=STR_105;
 end;
end;
//---------------------------------------------

{ TBeepFunc }

constructor TBeepFunc.Create;
begin
  inherited;
end;

destructor TBeepFunc.Destroy;
begin
  inherited;
end;

function TBeepFunc.Execute: variant;
begin
 Result:=false;
 Beep;
 Result:=true;
end;

function TBeepFunc.GetFuncName: string;
begin
 Result:='BEEP';
end;

function TBeepFunc.GetHint: string;
begin
 Result:=STR_125+' BEEP: boolean';
end;

function TBeepFunc.GetLikeFuncName: string;
begin
 Result:='Beep';
end;

function TBeepFunc.GetParamCount: Integer;
begin
 Result:=0;
end;

function TBeepFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_126;
end;

{ TSetDecimalSeparatorFunc }

constructor TSetDecimalSeparatorFunc.Create;
begin
  inherited;
end;

destructor TSetDecimalSeparatorFunc.Destroy;
begin
  inherited;
end;

function TSetDecimalSeparatorFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   Result:=ADecimalSeparator;
   FOnGetParam(Prm);
   ADecimalSeparator:=string(Prm)[1];
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TSetDecimalSeparatorFunc.GetFuncName: string;
begin
 Result:='SETDECIMALSEPARATOR';
end;

function TSetDecimalSeparatorFunc.GetHint: string;
begin
 Result:=STR_127+' SETDECIMALSEPARATOR(Sep: string): string';
end;

function TSetDecimalSeparatorFunc.GetLikeFuncName: string;
begin
 Result:='SetDecimalSeparator';
end;

function TSetDecimalSeparatorFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TSetDecimalSeparatorFunc.GetParamHint(
  const Index: Integer): string;
begin
 Result:=STR_128;
end;

{ TSetDateSeparatorFunc }

constructor TSetDateSeparatorFunc.Create;
begin
  inherited;
end;

destructor TSetDateSeparatorFunc.Destroy;
begin
  inherited;
end;

function TSetDateSeparatorFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   Result:=ADateSeparator;
   FOnGetParam(Prm);
   ADateSeparator:=string(Prm)[1];
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TSetDateSeparatorFunc.GetFuncName: string;
begin
 Result:='SETDATESEPARATOR';
end;

function TSetDateSeparatorFunc.GetHint: string;
begin
 Result:=STR_129+' SETDATESEPARATOR(Sep: string): string';
end;

function TSetDateSeparatorFunc.GetLikeFuncName: string;
begin
 Result:='SetDateSeparator';
end;

function TSetDateSeparatorFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TSetDateSeparatorFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_128;
end;

{ TSetTimeSeparatorFunc }

constructor TSetTimeSeparatorFunc.Create;
begin
  inherited;
end;

destructor TSetTimeSeparatorFunc.Destroy;
begin
  inherited;
end;

function TSetTimeSeparatorFunc.Execute: variant;
var Prm: Variant;
begin
 if Assigned(FOnGetParam) then
  begin
   Result:=ATimeSeparator;
   FOnGetParam(Prm);
   ATimeSeparator:=string(Prm)[1];
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TSetTimeSeparatorFunc.GetFuncName: string;
begin
 Result:='SETTIMESEPARATOR';
end;

function TSetTimeSeparatorFunc.GetHint: string;
begin
 Result:=STR_130+' SETTIMESEPARATOR(Sep: string): string';
end;

function TSetTimeSeparatorFunc.GetLikeFuncName: string;
begin
 Result:='SetTimeSeparator';
end;

function TSetTimeSeparatorFunc.GetParamCount: Integer;
begin
 Result:=1;
end;

function TSetTimeSeparatorFunc.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_128;
end;

{ TRaiseCommand }

constructor TRaiseCommand.Create;
begin
  inherited;
end;

destructor TRaiseCommand.Destroy;
begin
  inherited;
end;

function TRaiseCommand.Execute: variant;
var Prm: Variant;
begin
 Result:=false;
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   raise EunCalckError.Create(string(Prm));
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TRaiseCommand.GetFuncName: string;
begin
 Result:='RAISE';
end;

function TRaiseCommand.GetHint: string;
begin
 Result:=STR_131;
end;

function TRaiseCommand.GetLikeFuncName: string;
begin
 Result:='Raise';
end;

function TRaiseCommand.GetParamCount: Integer;
begin
 Result:=1;
end;

function TRaiseCommand.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_132;
end;

{ TExceptCommand }

constructor TExceptCommand.Create;
begin
  inherited;
end;

destructor TExceptCommand.Destroy;
begin
  inherited;
end;

function TExceptCommand.Execute: variant;
var Stalker: TunStalker;
    Prm: Variant;
begin
 Result:=false;
 Stalker:=Owner.AStalker;
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   Stalker.LabelOnError:=Prm;
   Result:=true;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TExceptCommand.GetFuncName: string;
begin
 Result:='ONEXCEPT';
end;

function TExceptCommand.GetHint: string;
begin
 Result:=STR_133;
end;

function TExceptCommand.GetLikeFuncName: string;
begin
 Result:='OnExcept';
end;

function TExceptCommand.GetParamCount: Integer;
begin
 Result:=1;
end;

function TExceptCommand.GetParamHint(const Index: Integer): string;
begin
 Result:=STR_134;
end;


{ TMonthNameByNumber }

constructor TMonthNameByNumber.Create;
begin
  inherited;
  FNamesMonth[1]:=STR_135;
  FNamesMonth[2]:=STR_136;
  FNamesMonth[3]:=STR_137;
  FNamesMonth[4]:=STR_138;
  FNamesMonth[5]:=STR_139;
  FNamesMonth[6]:=STR_140;
  FNamesMonth[7]:=STR_141;
  FNamesMonth[8]:=STR_142;
  FNamesMonth[9]:=STR_143;
  FNamesMonth[10]:=STR_144;
  FNamesMonth[11]:=STR_145;
  FNamesMonth[12]:=STR_146;
end;

destructor TMonthNameByNumber.Destroy;
begin
  inherited;
end;

function TMonthNameByNumber.Execute: variant;
var Prm: Variant;
    Index: Integer;
    isLover: boolean;
    TempName: string;
begin
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   isLover:=Prm;
   FOnGetParam(Prm);
   Index:=Prm;
   if (Index < 1) or (Index > 12) then
    TempName:=STR_147
   else
    TempName:=FNamesMonth[Index];
   if isLover then
    TempName[1]:=AnsiLowerCase(TempName[1])[1];
   Result:=TempName;
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
end;

function TMonthNameByNumber.GetFuncName: string;
begin
 Result:='MONTHNAMEBYNUMBER';
end;

function TMonthNameByNumber.GetHint: string;
begin
 Result:=STR_148+' MonthNameByNumber(NonthNum: Integer, IsLoverCase: boolean)';
end;

function TMonthNameByNumber.GetLikeFuncName: string;
begin
 Result:='MonthNameByNumber';
end;

function TMonthNameByNumber.GetParamCount: Integer;
begin
 Result:=2;
end;

function TMonthNameByNumber.GetParamHint(const Index: Integer): string;
begin
 case Index of
  0: Result:=STR_149;
  1: Result:=STR_150+' - boolean';
 end;
end;

{ TGoSub }

constructor TGoSub.Create;
begin
  inherited;
end;

destructor TGoSub.Destroy;
begin
  inherited;
end;

function TGoSub.Execute: variant;
var Prm: Variant;
    Poz: Integer;
    Stalker: TunStalker;
    OldPosition: Integer;
    FLabel: string;
begin
 Result:=false;
 Stalker:=Owner.AStalker;
 if Assigned(FOnGetParam) then
  begin
   FOnGetParam(Prm);
   FLabel:=AnsiUpperCase(string(Prm));
   OldPosition:=Owner.ACompiler.Position;
   Stalker.SubStack.Push(OldPosition);
   Poz:=Owner.ACompiler.FindString(FLabel);
   if Poz > 0 then
    begin
     Owner.ACompiler.Position:=Poz;
     Stalker.GetTuken;
    end
   else
    raise EunCalckError.Create(ERROR_DONT_FIND_LABEL+FLabel);
  end
 else
  raise EunCalckError.Create(ERROR_DONT_GET_PARAM+FuncName);
 Result:=true;
end;

function TGoSub.GetFuncName: string;
begin
 Result:='GOSUB';
end;

function TGoSub.GetHint: string;
begin
 Result:=STR_151+' ":FuncName". GoSub(":FuncName");';
end;

function TGoSub.GetLikeFuncName: string;
begin
 Result:='GoSub';
end;

function TGoSub.GetParamCount: Integer;
begin
 Result:=1;
end;

function TGoSub.GetParamHint(const Index: Integer): string;
begin
 Result:='0. FuncName: string';
end;

{ TReturn }

constructor TReturn.Create;
begin
  inherited;
end;

destructor TReturn.Destroy;
begin
  inherited;
end;

function TReturn.Execute: variant;
var Stalker: TunStalker;
    OldPosition: Integer;
begin
 Result:=false;
 Stalker:=Owner.AStalker;
 OldPosition:=Stalker.SubStack.Pop - 1;
 Owner.ACompiler.Position:=OldPosition;
 Stalker.GetTuken;
 Result:=true;
end;

function TReturn.GetFuncName: string;
begin
 Result:='RETURN';
end;

function TReturn.GetHint: string;
begin
 Result:=STR_152;
end;

function TReturn.GetLikeFuncName: string;
begin
 Result:='Return';
end;

function TReturn.GetParamCount: Integer;
begin
 Result:=0;
end;

function TReturn.GetParamHint(const Index: Integer): string;
begin
 Result:='';
end;

{ TOrd }

constructor TOrd.Create;
begin
  inherited;
end;

destructor TOrd.Destroy;
begin
  inherited;
end;

function TOrd.Execute: variant;
var Val: Variant;
    TempChar: Char;
    TempString: string;
begin
 FOnGetParam(Val);
 TempString:=string(Val);
 if Length(TempString) > 0 then
  begin
   TempChar:=TempString[1];
   Result:=Ord(TempChar);
  end
 else
  raise Exception.Create('Not actual parametr !');
end;

function TOrd.GetFuncName: string;
begin
 Result:='ORD';
end;

function TOrd.GetHint: string;
begin
 Result:='Return Byte code of Char. function Ord(X: Char): Byte;';
end;

function TOrd.GetLikeFuncName: string;
begin
 Result:='Ord';
end;

function TOrd.GetParamCount: Integer;
begin
 Result:=1;
end;

function TOrd.GetParamHint(const Index: Integer): string;
begin
 Result:='Char';
end;

{ TChr }

constructor TChr.Create;
begin
  inherited;
end;

destructor TChr.Destroy;
begin
  inherited;
end;

function TChr.Execute: variant;
var Val: Variant;
begin
 FOnGetParam(Val);
 Result:=Chr(Byte(Val));
end;

function TChr.GetFuncName: string;
begin
 Result:='CHR';
end;

function TChr.GetHint: string;
begin
 Result:='Return Char of byte code. function Chr(X: Byte): Char;';
end;

function TChr.GetLikeFuncName: string;
begin
 Result:='Chr';
end;

function TChr.GetParamCount: Integer;
begin
 Result:=1;
end;

function TChr.GetParamHint(const Index: Integer): string;
begin
 Result:='Byte.';
end;

{ TVarArrayOf }

constructor TVarArrayOf.Create;
begin
  inherited;
end;

destructor TVarArrayOf.Destroy;
begin
  inherited;
end;

function TVarArrayOf.Execute: variant;
var Val: Variant;
    Arr: array of Variant;
    I, J: Integer;
begin
 FOnGetParam(Val);
 if Val <> ']' then
  raise Exception.Create('Exceprion create Array !');
 I:=1;
 while Val <> '[' do
  begin
   FOnGetParam(Val);
   SetLength(Arr, I);
   Arr[I-1]:=Val;
   I:=I+1;
  end;
 for J:=0 to I Mod 2 do
  begin
   I:=I-1;
   Val:=Arr[J];
   Arr[J]:=Arr[I];
   Arr[I]:=Val;
  end;
 Result:=VarArrayOf(Arr);
end;

function TVarArrayOf.GetFuncName: string;
begin
 Result:='VARARRAYOF';
end;

function TVarArrayOf.GetHint: string;
begin
 Result:='Create Array of Variant. function VarArrayOf([Val1: Variant, Val2: Variant .. ValN: Variant]): Variant;';
end;

function TVarArrayOf.GetLikeFuncName: string;
begin
 Result:='VarArrayOf';
end;

function TVarArrayOf.GetParamCount: Integer;
begin
 Result:=1;
end;

function TVarArrayOf.GetParamHint(const Index: Integer): string;
begin
 Result:='Open array values in ''['' and '']''';
end;

initialization

 ATimeSeparator:=FormatSettings.TimeSeparator;
 ADateSeparator:=FormatSettings.DateSeparator;
 ADecimalSeparator:=FormatSettings.DecimalSeparator;

end.


