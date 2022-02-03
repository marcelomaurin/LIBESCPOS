unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ubarcodes,
  SdpoSerial, imp_ELGINI9;

type

  { TForm1 }

  TForm1 = class(TForm)
    BarcodeQR1: TBarcodeQR;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    edBarcode: TEdit;
    Label1: TLabel;
    SdpoSerial1: TSdpoSerial;
    ToggleBox1: TToggleBox;
    ToggleBox2: TToggleBox;
    ToggleBox3: TToggleBox;
    ToggleBox4: TToggleBox;
    ToggleBox5: TToggleBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure edBarcodeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure ToggleBox2Change(Sender: TObject);
    procedure ToggleBox2Click(Sender: TObject);
    procedure ToggleBox3Click(Sender: TObject);
    procedure ToggleBox4Change(Sender: TObject);
    procedure ToggleBox4Click(Sender: TObject);
    procedure ToggleBox5Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  SdpoSerial1.open;
  //SdpoSerial1.WriteData(#9+Edit1.text+#00);
  SdpoSerial1.WriteData(Edit1.text);
  SdpoSerial1.close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SdpoSerial1.open;
  //SdpoSerial1.WriteData(#29+#107+#10+#73+#10+#123+#66+#78+#111+#46+#123+#67+#12+#34+#56+#00);
  SdpoSerial1.WriteData(IMPELGINI9.beep());
  SdpoSerial1.close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    SdpoSerial1.open;
  //SdpoSerial1.WriteData(#27+#74+#20);
  SdpoSerial1.WriteData(IMPELGINI9.Negrito());
  SdpoSerial1.close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    SdpoSerial1.open;
  //SdpoSerial1.WriteData(#27+#74+#20);
  SdpoSerial1.WriteData(IMPELGINI9.Normal());
  SdpoSerial1.close;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  SdpoSerial1.open;
//SdpoSerial1.WriteData(#27+#74+#20);
SdpoSerial1.WriteData(IMPELGINI9.Sublinhado());
SdpoSerial1.close;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  SdpoSerial1.open;
  SdpoSerial1.WriteData(IMPELGINI9.Guilhotina());
  SdpoSerial1.close;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
SdpoSerial1.open;
//SdpoSerial1.WriteData(#27+#74+#20);
SdpoSerial1.WriteData(IMPELGINI9.DoubleTexto());
SdpoSerial1.close;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  SdpoSerial1.open;
  SdpoSerial1.WriteData(IMPELGINI9.AcionaGaveta());
  SdpoSerial1.close;
end;

procedure TForm1.edBarcodeChange(Sender: TObject);
begin
  BarcodeQR1.Text:= edBarcode.text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IMPELGINI9 := TIMP_ELGINI9.create();
  Edit2.text := SdpoSerial1.Device;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  IMPELGINI9.free;
  IMPELGINI9 := nil;
end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin
  SdpoSerial1.open;
  //SdpoSerial1.WriteData(#27+#74+#20);
  SdpoSerial1.WriteData(IMPELGINI9.NewLine());
  SdpoSerial1.close;
end;

procedure TForm1.ToggleBox2Change(Sender: TObject);
begin

end;

procedure TForm1.ToggleBox2Click(Sender: TObject);
begin
  SdpoSerial1.open;
  SdpoSerial1.WriteData(#27+#33+#1);
  SdpoSerial1.close;
end;

procedure TForm1.ToggleBox3Click(Sender: TObject);
begin
  SdpoSerial1.open;
  SdpoSerial1.WriteData(#27+#33+#0);
  SdpoSerial1.close;
end;

(*
function Base64FromBitmap(Bitmap: TBitmap): string;
var
  Stream: TBytesStream;
  Encoding: TBase64Encoding;
begin
  Stream := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Stream);
    Encoding := TBase64Encoding.Create(0);
    try
      Result := Encoding.EncodeBytesToString(Copy(Stream.Bytes, 0, Stream.Size));
    finally
      Encoding.Free;
    end;
  finally
    Stream.Free;
  end;
end;

procedure BitmapFromBase64(Base64: string; Bitmap: TBitmap);
var
  Stream: TBytesStream;
  Bytes: TBytes;
  Encoding: TBase64Encoding;
begin
  Stream := TBytesStream.Create;
  try
    Encoding := TBase64Encoding.Create(0);
    try
      Bytes := Encoding.DecodeStringToBytes(Base64);
      Stream.WriteData(Bytes, Length(Bytes));
      Stream.Position := 0;
      Bitmap.LoadFromStream(Stream);
    finally
      Encoding.Free;
    end;
  finally
    Stream.Free;
  end;
end;
*)


procedure TForm1.ToggleBox4Change(Sender: TObject);
var
  bmp : Graphics.TBitmap;
  Stream : TFileStream;
  info : ansiString;
  x , y : integer;
begin
  SdpoSerial1.open;
  (*
  bmp := Graphics.TBitmap.Create;
  //StringGrid1 := TStringGrid.create();

  BarcodeQR1.Text:= Edit1.text;
  BarcodeQR1.Generate;
  bmp.Canvas.Brush.Color := clWhite;
  x:= BarcodeQR1.Width;
  y:= BarcodeQR1.Height;
  bmp.SetSize(BarcodeQR1.ClientWidth, BarcodeQR1.ClientHeight);
  //info := BarcodeQR1.Canvas.Brush.Bitmap.ToString;
  bmp.Assign(BarcodeQR1.Canvas.Brush.Bitmap);
  info := bmp.ToString;
  //info := Base64FromBitmap(BarcodeQR1.Canvas.Brush.Bitmap);
  SdpoSerial1.WriteData(IMPELGINI9.loadImagem(x,y,info));
  sleep(100);
  *)

  //SdpoSerial1.WriteData(IMPELGINI9.Barra2D('http://maurinsoft.com.br'));
  SdpoSerial1.WriteData(IMPELGINI9.Centralizado());
  sleep(100);
  SdpoSerial1.WriteData(IMPELGINI9.PaginaM616());
  sleep(100);
  SdpoSerial1.WriteData(IMPELGINI9.CorPg618());
  sleep(100);
  SdpoSerial1.WriteData(IMPELGINI9.HabilitaArmazenaDados());
  sleep(100);
  //SdpoSerial1.WriteData(IMPELGINI9.Armazenadados('mjBNoBoQVihMwTzUA+IBlgU12si36ipyVC2L+W5PhCvvqx1xVF/moy4wIzGTfWYpqsMa0641ZBFJFWnWIo78YBBE4m2GwGen84VTPz9iwvs4QkAQdijCiX6TA3wWSjIdiYhqyDroH0IBGnIOWug8ModehDreQFyDdnvAUVItszFVKW12/1JFhu9nxneAAKlJYecY46W3LcOOQSvt1yOcJzM74l+BsmlcYZZVi4I1mEazoj7YzG3Rx64444444'));
  //bmp := Graphics.TBitmap.Create;
  //bmp.Assign(BarcodeQR1.Canvas.Brush.Bitmap);
  //info := bmp.ToString;
  //info := BarcodeQR1.Text;
  //info := BarcodeQR1.ToString;
  //info := BarcodeQR1.ToString;
  info := edBarcode.t;
  SdpoSerial1.WriteData(IMPELGINI9.Armazenadados(info));
  sleep(100);
  SdpoSerial1.WriteData(IMPELGINI9.ImprimeQRCODEArmazenado());
  sleep(100);


  SdpoSerial1.close;

end;

procedure TForm1.ToggleBox4Click(Sender: TObject);
begin
  SdpoSerial1.open;
  //SdpoSerial1.WriteData(#29+#107+#10+#73+#10+#123+#66+#78+#111+#46+#123+#67+#12+#34+#56+#00);
  SdpoSerial1.WriteData(#29+#107+#73+#4+#6+'123456'+#00);
  SdpoSerial1.close;
end;

procedure TForm1.ToggleBox5Change(Sender: TObject);
begin
  SdpoSerial1.Device:= Edit2.text;
  ShowMessage('Device Change!');
end;

end.

