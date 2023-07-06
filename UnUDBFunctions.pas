
          //--------------------------------------------//
          //         Универсальная База Данних.         //
          //         Перед прочтением сжечь !           //
          //         Copiryght@ 1996-2000.              //
          //         Programmer Bannikov N.A.           //
          //         Universal Database Server 5.0      //
          //         STIKRIZ Tchnology.                 //
          //                                            //
          //--------------------------------------------//

unit UnUDBFunctions;

interface

uses UnConstants,
  db, classes,
  //UnZLib,
  //CodeClasses,
  Sysutils, Variants;

type
   TReadWriteStreamEvent = procedure of object;
   TCompressionLevel = Integer;
   TTypeValue = Integer;

procedure SaveValue(const DataSet: TDataSet; const Count: Integer;
  const TypeValue: TTypeValue; const Field: TField; const Str: TStream;
  const isFirst, isSaveBlob: boolean; const SaveEvent: TReadWriteStreamEvent = nil);

procedure SaveInt(const Value: Integer; const Str: TStream);
procedure LoadInt(var Value: Integer; const Str: TStream);
procedure SaveFloat(const Value: Extended; const Str: TStream);
procedure LoadFloat(var Value: Extended; const Str: TStream);
procedure SaveDateTime(const Value: TDateTime; const Str: TStream);
procedure LoadDateTime(var Value: TDateTime; const Str: TStream);
procedure SaveString(const Value: string; const Str: TStream);
procedure LoadString(var Value: string; const Str: TStream);
procedure SaveBool(const Value: boolean; const Str: TStream);
procedure LoadBool(var Value: boolean; const Str: TStream);
procedure SaveBlob(const Value: string; const Str: TStream);
procedure LoadBlob(var Value: string; const Str: TStream);
procedure SaveByte(const Value: Byte; const Str: TStream);
procedure LoadByte(var Value: Byte; const Str: TStream);
procedure SaveStream(const ValSTR: TStream; const Str: TStream);
procedure LoadStream(var ValSTR: TStream; const Str: TStream);

function CopyStrToVariant(const Str: TStream): Variant;
procedure CopyVariantToStr(const Value: Variant; const Str: TStream);
procedure PackStream(const Str: TStream; CompressionLevel: TCompressionLevel);
procedure UnPackStream(const Str: TStream);
procedure CryptStream(const Str: TStream; const Password: string);
procedure DeCryptStream(const Str: TStream; const Password: string);

function ConvertString(const Val: string; Ofset: Integer = 1): string;
function DeconvertString(const Val: string; Ofset: Integer = 1): string;

function CheckErrorMessage(const Value: string): string;

procedure DeleteFiles(const StartPath: string);

implementation

procedure DeleteFiles(const StartPath: string);
var sr: TSearchRec;
begin
 if FindFirst(StartPath+'*.*', faAnyFile, sr) = 0 then
  begin
   if sr.Name[1] <> '.' then
    begin
     if (sr.Attr and faDirectory) = faDirectory then
      DeleteFiles(StartPath+sr.Name+'\')
     else
      DeleteFile(StartPath+sr.Name)
    end;
   while FindNext(sr) = 0 do
    begin
     if sr.Name[1] <> '.' then
      begin
       if (sr.Attr and faDirectory) = faDirectory then
        DeleteFiles(StartPath+sr.Name+'\')
       else
        DeleteFile(StartPath+sr.Name)
      end;
    end;
  FindClose(sr);
  RemoveDir(StartPath);
 end;
end;

procedure SaveValue(const DataSet: TDataSet; const Count: Integer;
  const TypeValue: TTypeValue; const Field: TField; const Str: TStream;
  const isFirst, isSaveBlob: boolean; const SaveEvent: TReadWriteStreamEvent = nil);
var I: Integer;
    IsEvent: boolean;
    TempText: TStringList;
begin
 if isFirst then
  DataSet.First;
 IsEvent:=Assigned(SaveEvent);
 case TypeValue of
  unt_Integer, unt_Pointer: begin
    for I:=0 to Count-1 do
     begin
      SaveInt(Field.AsInteger, Str);
      if IsEvent then
       SaveEvent;
      if Count > 1 then
       DataSet.Next;
     end;
   end;
  unt_Float, unt_Money: Begin
    for I:=0 to Count-1 do
     begin
      SaveFloat(Field.AsFloat, Str);
      if IsEvent then
       SaveEvent;
      if Count > 1 then
       DataSet.Next;
     end;
   end;
  unt_Date, unt_Time, unt_DateTime: begin
    for I:=0 to Count-1 do
     begin
      SaveDateTime(Field.AsDateTime, Str);
      if IsEvent then
       SaveEvent;
      if Count > 1 then
       DataSet.Next;
     end;
   end;
  unt_String: begin
    for I:=0 to Count-1 do
     begin
      SaveString(Field.AsString, Str);
      if IsEvent then
       SaveEvent;
      if Count > 1 then
       DataSet.Next;
     end;
   end;
  unt_Boolean: begin
    for I:=0 to Count-1 do
     begin
      SaveBool(Field.AsBoolean, Str);
      if IsEvent then
       SaveEvent;
      if Count > 1 then
       DataSet.Next;
     end;
   end;
  unt_Blob, unt_Text, unt_FText, unt_Picture, unt_OLE, unt_HTML: begin
    if isSaveBlob then
     begin
      TempText:=TStringList.Create;
      try
       for I:=0 to Count-1 do
        begin
         TempText.Clear;
         TempText.Assign(Field);
         SaveBlob(TempText.Text, Str);
         if IsEvent then
          SaveEvent;
         DataSet.Next;
      if Count > 1 then
       DataSet.Next;
        end;
      finally
       TempText.Free;
      end;
     end;
   end;
 end;
end;

procedure SaveInt(const Value: Integer; const Str: TStream);
//var Buffer: Integer;
begin
// Buffer:=Value;
// Str.Write(Buffer, Sizeof(Integer));
 Str.Write(Value, Sizeof(Integer));
end;

procedure LoadInt(var Value: Integer; const Str: TStream);
//var Buffer: Integer;
begin
 Str.Read(Value, Sizeof(Integer));
 //Str.Read(Buffer, Sizeof(Integer));
 //Value:=Buffer;
end;

procedure SaveFloat(const Value: Extended; const Str: TStream);
//var Buffer: Extended;
begin
// Buffer:=Value;
 //Str.Write(Buffer, Sizeof(Extended));
 Str.Write(Value, Sizeof(Extended));
end;

procedure LoadFloat(var Value: Extended; const Str: TStream);
//var Buffer: Extended;
begin
 Str.Read(Value, Sizeof(Extended));
// Str.Read(Buffer, Sizeof(Extended));
// Value:=Buffer;
end;

procedure SaveDateTime(const Value: TDateTime; const Str: TStream);
//var Buffer: TDateTime;
begin
// Buffer:=Value;
// Str.Write(Buffer, Sizeof(TDateTime));
 Str.Write(Value, Sizeof(TDateTime));
end;

procedure LoadDateTime(var Value: TDateTime; const Str: TStream);
//var Buffer: TDateTime;
begin
 Str.Read(Value, Sizeof(TDateTime));
// Str.Read(Buffer, Sizeof(TDateTime));
// Value:=Buffer;
end;

procedure SaveString(const Value: string; const Str: TStream);
var //Buffer: string;
    Count: Integer;
begin
// Buffer:=Value;
 Count:=Length(Value);
 Str.Write(Count, Sizeof(Integer));
 Str.Write(Value[1], Count);
// Str.Write(Buffer[1], Count);
end;

procedure LoadString(var Value: string; const Str: TStream);
var //Buffer: string;
    Count: Integer;
begin
 Str.Read(Count, Sizeof(Integer));
 //SetLength(Buffer, Count);
 SetLength(Value, Count);
 Str.Read(Value[1], Count);
// Value:=Buffer;
end;

procedure SaveBool(const Value: boolean; const Str: TStream);
//var Buffer: boolean;
begin
// Buffer:=Value;
// Str.Write(Buffer, Sizeof(boolean));
 Str.Write(Value, Sizeof(boolean));
end;

procedure LoadBool(var Value: boolean; const Str: TStream);
//var Buffer: boolean;
begin
 Str.Read(Value, Sizeof(boolean));
// Str.Read(Buffer, Sizeof(boolean));
// Value:=Buffer;
end;

procedure SaveBlob(const Value: string; const Str: TStream);
var //Buffer: string;
    Count: Integer;
begin
 //Buffer:=Value;
 Count:=Length(Value);
 Str.Write(Count, Sizeof(Integer));
 //Str.Write(Buffer[1], Count);
 Str.Write(Value[1], Count);
end;

procedure LoadBlob(var Value: string; const Str: TStream);
var //Buffer: PChar;
    Count: Integer;
begin
 Str.Read(Count, Sizeof(Integer));
 //Buffer:=StrAlloc(Count);
 //try
// Str.Read(Buffer, Count);
 SetLength(Value, Count);
 Str.Read(Value[1], Count);
// Value:=StrPas(Buffer);
// finally
//  StrDispose(Buffer);
// end;
end;

procedure SaveByte(const Value: Byte; const Str: TStream);
//var Buffer: Byte;
begin
// Buffer:=Value;
// Str.Write(Buffer, Sizeof(Byte));
 Str.Write(Value, Sizeof(Byte));
end;

procedure LoadByte(var Value: Byte; const Str: TStream);
//var Buffer: Byte;
begin
 Str.Read(Value, Sizeof(Byte));
// Str.Read(Buffer, Sizeof(Byte));
// Value:=Buffer;
end;

function CopyStrToVariant(const Str: TStream): Variant;
var Buffer: PChar;
begin
 Result:=VarArrayCreate([0, Str.Size], varByte);
 Buffer:=VarArrayLock(Result);
 try
  Str.Position:=0;
  Str.Read(Buffer^, Str.Size);
 finally
  VarArrayUnlock(Result);
 end;
end;

procedure CopyVariantToStr(const Value: Variant; const Str: TStream);
var Buffer: PChar;
    Count: Integer;
begin
 Count:=VarArrayHighBound(Value, 1);
 Buffer:=VarArrayLock(Value);
 try
  Str.Size:=0;
  Str.Write(Buffer^, Count);
 finally
  VarArrayUnlock(Value);
 end;
end;

procedure PackStream(const Str: TStream; CompressionLevel: TCompressionLevel);
var TempStr: TMemoryStream;
//    Comp: TCompressionStream;
begin
{
 if Str.Size = 0 then
  exit;
 TempStr:=TMemoryStream.Create;
 try
  Comp:=TCompressionStream.Create(CompressionLevel, TempStr);
  try
   Str.Position:=0;
   Comp.CopyFrom(Str, Str.Size);
  finally
   Comp.Free;
  end;
  Str.Size:=0;
  TempStr.Position:=0;
  Str.CopyFrom(TempStr, TempStr.Size);
 finally
  TempStr.Free;
 end;
 }
end;

procedure UnPackStream(const Str: TStream);
var TempStr: TMemoryStream;
//    Comp: TDecompressionStream;
    Count: Integer;
begin
{
 if Str.Size = 0 then
  exit;
 TempStr:=TMemoryStream.Create;
 try
  Str.Position:=0;
  Comp:=TDecompressionStream.Create(Str);
  try
   Count:=0;
   while Comp.Seek(256, soFromCurrent) > Count do
    begin
     Count:=Comp.Position;
    end;
   Count:=Comp.Position;
   Comp.Seek(0, soFromBeginning);
   TempStr.CopyFrom(Comp, Count);
  finally
   Comp.Free;
  end;
  Str.Size:=0;
  TempStr.Position:=0;
  Str.CopyFrom(TempStr, TempStr.Size);
 finally
  TempStr.Free;
 end;
 }
end;

procedure CryptStream(const Str: TStream; const Password: string);
var
//    Crpt: TStreamCrypt;
    TempStr: TMemoryStream;
begin
{
 Crpt:=TStreamCrypt.Create;
 try
  TempStr:=TMemoryStream.Create;
  try
   Str.Position:=0;
   Crpt.InputStream:=Str;
   Crpt.OutputStream:=TempStr;
   Crpt.Password:=Password;
   Crpt.ExecuteCrypt;
   Str.Size:=0;
   TempStr.Position:=0;
   Str.CopyFrom(TempStr, TempStr.Size);
  finally
   TempStr.Free;
  end;
 finally
  Crpt.Free;
 end;
 }
end;

procedure DeCryptStream(const Str: TStream; const Password: string);
var
//    Crpt: TStreamCrypt;
    TempStr: TMemoryStream;
begin
{
 Crpt:=TStreamCrypt.Create;
 try
  TempStr:=TMemoryStream.Create;
  try
   Str.Position:=0;
   Crpt.InputStream:=Str;
   Crpt.OutputStream:=TempStr;
   Crpt.Password:=Password;
   Crpt.ExecuteDeCrypt;
   Str.Size:=0;
   TempStr.Position:=0;
   Str.CopyFrom(TempStr, TempStr.Size);
  finally
   TempStr.Free;
  end;
 finally
  Crpt.Free;
 end;
 }
end;

procedure SaveStream(const ValSTR: TStream; const Str: TStream);
begin
 SaveInt(ValSTR.Size, Str);
 if ValSTR.Size > 0 then
  begin
   ValSTR.Position:=0;
   Str.CopyFrom(ValSTR, ValSTR.Size);
  end;
end;

procedure LoadStream(var ValSTR: TStream; const Str: TStream);
var TempInt: Integer;
begin
 LoadInt(TempInt, Str);
 ValSTR.Size:=0;
 if TempInt > 0 then
  begin
   ValSTR.CopyFrom(Str, TempInt);
   ValSTR.Position:=0;
  end;
end;

function ConvertString(const Val: string; Ofset: Integer = 1): string;
var I, Len: Integer;
begin
 Result:='';
 Len:=Length(Val);
 for I:=Ofset to Len do
  begin
   Result:=Result+IntToStr(Ord(Val[I]))+'\';
  end;
end;

function DeconvertString(const Val: string; Ofset: Integer = 1): string;
var I, Len: Integer;
    Tmp: string;
begin
 Result:='';
 Tmp:='';
 Len:=Length(Val);
 for I:=Ofset to Len do
  begin
   if Val[I] = '\' then
    begin
     Result:=Result+Chr(StrToInt(Tmp));
     Tmp:='';
    end
   else
    Tmp:=Tmp+Val[I];
  end;
end;

function CheckErrorMessage(const Value: string): string;
begin
 Result:=Trim(Value);
 if Result[Length(Result)] = '\' then
   Result:=DeconvertString(Result);
end;

end.
