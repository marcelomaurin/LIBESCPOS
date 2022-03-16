unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ubarcodes,
  SdpoSerial, LazSerial,  imp;

type

  { Tfrmmain }

  Tfrmmain = class(TForm)
    BarcodeQR1: TBarcodeQR;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    btLeft: TButton;
    btCenter: TButton;
    btRight: TButton;
    cbModelo: TComboBox;
    edTexto: TEdit;
    edDevice: TEdit;
    edBarcode: TEdit;
    GroupBox1: TGroupBox;
    gbFormat: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LazSerial1: TLazSerial;
    ToggleBox1: TToggleBox;
    ToggleBox2: TToggleBox;
    ToggleBox3: TToggleBox;
    ToggleBox4: TToggleBox;
    ToggleBox5: TToggleBox;
    btQRCODE: TToggleBox;
    procedure btCenterClick(Sender: TObject);
    procedure btLeftClick(Sender: TObject);
    procedure btRightClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
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
    procedure ToggleBox6Change(Sender: TObject);
    procedure ToggleBox7Change(Sender: TObject);
    procedure ToggleBox8Change(Sender: TObject);
  private
    FIMP : TIMP;
    FFormat : CFormat;
    FTypeText : CTypeText;
  public

  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.lfm}

{ Tfrmmain }

procedure Tfrmmain.Button1Click(Sender: TObject);
begin
  FIMP.TextoSerial(edtexto.text, FFORMAT,FTYPETEXT);
  //LazSerial1.WriteData(#9+edTexto.text+#00);
  //LazSerial1.WriteData(edTexto.text);

end;

procedure Tfrmmain.btLeftClick(Sender: TObject);
begin
    FFORMAT := FLeft;
end;

procedure Tfrmmain.btRightClick(Sender: TObject);
begin
    FFORMAT := FRigth;
end;

procedure Tfrmmain.btCenterClick(Sender: TObject);
begin
    FFORMAT := FCenter;
end;

procedure Tfrmmain.Button2Click(Sender: TObject);
begin

  //LazSerial1.WriteData(#29+#107+#10+#73+#10+#123+#66+#78+#111+#46+#123+#67+#12+#34+#56+#00);
  //LazSerial1.WriteData(FIMP.beep());
  FIMP.beep

end;

procedure Tfrmmain.Button3Click(Sender: TObject);
begin
  FTypeText:=  TT_BOLD ;
  //LazSerial1.WriteData(#27+#74+#20);
  //LazSerial1.WriteData(FIMP.Negrito());

end;

procedure Tfrmmain.Button4Click(Sender: TObject);
begin
  FTypeText := TT_NORMAL;
  //LazSerial1.WriteData(#27+#74+#20);
  //LazSerial1.WriteData(IMPELGINI9.Normal());

end;

procedure Tfrmmain.Button5Click(Sender: TObject);
begin
  FTypeText:= TT_UNDERLINE;
//LazSerial1.WriteData(#27+#74+#20);
//LazSerial1.WriteData(IMPELGINI9.Sublinhado());

end;

procedure Tfrmmain.Button6Click(Sender: TObject);
begin

  //LazSerial1.WriteData(IMPELGINI9.Guilhotina());
  FIMP.Guilhotina();

end;

procedure Tfrmmain.Button7Click(Sender: TObject);
begin
//LazSerial1.open;
//LazSerial1.WriteData(#27+#74+#20);
//FIMP.DoubleTexto());
//LazSerial1.close;
  FTypeText:= TT_DOUBLE;
end;

procedure Tfrmmain.Button8Click(Sender: TObject);
begin

  FIMP.Gaveta();

end;

procedure Tfrmmain.Button9Click(Sender: TObject);
begin
    FIMP.TextoSerial(edtexto.text, FFORMAT,FTYPETEXT);
    FIMP.LineSerial();
end;

procedure Tfrmmain.edBarcodeChange(Sender: TObject);
begin
  BarcodeQR1.Text:= edBarcode.text;
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  //IMPELGINI9 := TIMP_ELGINI9.create();
  FIMP := TIMP.create(LazSerial1);
  edDevice.text := LazSerial1.Device;
  FFormat:= FLeft;
  FTypeText := TT_NORMAL;
end;

procedure Tfrmmain.FormDestroy(Sender: TObject);
begin

  FIMP.free;
  FIMP := nil;
end;

procedure Tfrmmain.ToggleBox1Change(Sender: TObject);
begin
  //LazSerial1.open;
  //LazSerial1.WriteData(#27+#74+#20);
  //LazSerial1.WriteData(IMPELGINI9.NewLine());
  //LazSerial1.close;
  FIMP.LineSerial();
end;

procedure Tfrmmain.ToggleBox2Change(Sender: TObject);
begin

end;

procedure Tfrmmain.ToggleBox2Click(Sender: TObject);
begin
  //LazSerial1.open;
  //LazSerial1.WriteData(#27+#33+#1);
  //LazSerial1.close;
end;

procedure Tfrmmain.ToggleBox3Click(Sender: TObject);
begin
  //LazSerial1.open;
  //LazSerial1.WriteData(#27+#33+#0);
  //LazSerial1.close;
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


procedure Tfrmmain.ToggleBox4Change(Sender: TObject);
var
  bmp : Graphics.TBitmap;
  Stream : TFileStream;
  info : ansiString;
  x , y : integer;
begin
  //LazSerial1.open;
  (*
  bmp := Graphics.TBitmap.Create;
  //StringGrid1 := TStringGrid.create();

  BarcodeQR1.Text:= edTexto.text;
  BarcodeQR1.Generate;
  bmp.Canvas.Brush.Color := clWhite;
  x:= BarcodeQR1.Width;
  y:= BarcodeQR1.Height;
  bmp.SetSize(BarcodeQR1.ClientWidth, BarcodeQR1.ClientHeight);
  //info := BarcodeQR1.Canvas.Brush.Bitmap.ToString;
  bmp.Assign(BarcodeQR1.Canvas.Brush.Bitmap);
  info := bmp.ToString;
  //info := Base64FromBitmap(BarcodeQR1.Canvas.Brush.Bitmap);
  LazSerial1.WriteData(IMPELGINI9.loadImagem(x,y,info));
  sleep(100);
  *)

  //LazSerial1.WriteData(IMPELGINI9.Barra2D('http://maurinsoft.com.br'));
  //LazSerial1.WriteData(IMPELGINI9.Centralizado());
  //sleep(100);
  //LazSerial1.WriteData(IMPELGINI9.PaginaM616());
  //sleep(100);
  //LazSerial1.WriteData(IMPELGINI9.CorPg618());
  //sleep(100);
  //LazSerial1.WriteData(IMPELGINI9.HabilitaArmazenaDados());
  //sleep(100);
  //LazSerial1.WriteData(IMPELGINI9.Armazenadados('mjBNoBoQVihMwTzUA+IBlgU12si36ipyVC2L+W5PhCvvqx1xVF/moy4wIzGTfWYpqsMa0641ZBFJFWnWIo78YBBE4m2GwGen84VTPz9iwvs4QkAQdijCiX6TA3wWSjIdiYhqyDroH0IBGnIOWug8ModehDreQFyDdnvAUVItszFVKW12/1JFhu9nxneAAKlJYecY46W3LcOOQSvt1yOcJzM74l+BsmlcYZZVi4I1mEazoj7YzG3Rx64444444'));
  //bmp := Graphics.TBitmap.Create;
  //bmp.Assign(BarcodeQR1.Canvas.Brush.Bitmap);
  //info := bmp.ToString;
  //info := BarcodeQR1.Text;
  //info := BarcodeQR1.ToString;
  //info := BarcodeQR1.ToString;
  //info := edBarcode.text;
  //LazSerial1.WriteData(IMPELGINI9.Armazenadados(info));
  //sleep(100);
  //LazSerial1.WriteData(IMPELGINI9.ImprimeQRCODEArmazenado());
  //sleep(100);


  //LazSerial1.close;
  FIMP.PRINTBARCODE('1234567890');

end;

procedure Tfrmmain.ToggleBox4Click(Sender: TObject);
begin
  //LazSerial1.open;
  //LazSerial1.WriteData(#29+#107+#10+#73+#10+#123+#66+#78+#111+#46+#123+#67+#12+#34+#56+#00);
  //LazSerial1.WriteData(#29+#107+#73+#4+#6+'123456'+#00);
  //LazSerial1.close;
end;

procedure Tfrmmain.ToggleBox5Change(Sender: TObject);
begin

  FIMP.CLOSE;
  Fimp.device:= edDevice.text;
  FIMP.open;
  ShowMessage('Device Change!');
end;

procedure Tfrmmain.ToggleBox6Change(Sender: TObject);
begin
  FFORMAT := FLeft;
end;

procedure Tfrmmain.ToggleBox7Change(Sender: TObject);
begin
  FFormat:= FCenter;
end;

procedure Tfrmmain.ToggleBox8Change(Sender: TObject);
begin
  FFormat:= FRigth;
end;

end.

