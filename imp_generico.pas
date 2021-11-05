unit imp_generico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
     LF = #10;
     FF = #12;
     CR = #13;
     HT = #9;
     CAN = #24;
     ESC = #27;

type
  { TIMP_GENERICO }
  TIMP_GENERICO = class(TObject)
    FCOLUNA : integer;
    FSERIAL : String;

 private
    function getserial : string;
    procedure setserial(value : string);
 public
   constructor create();
   destructor destroy();
   function InitPrint(): string;
   function NewLine(): string;
   function LineText(Info : string): string;
   function Negrito(): string;
   function Normal(): string;
   function Sublinhado(): string;
   function DoubleTexto(): string;
   function beep(): string;
   function Guilhotina(): string;
   function Barra1D(Info : string): string;
   function Barra2D(info : String): string;
   function Imagem(Info : String): string;
   property Serial : String read getserial  write setserial;



end;

implementation



{ TIMP_GENERICO }

function TIMP_GENERICO.getserial: string;
begin

end;

procedure TIMP_GENERICO.setserial(value: string);
begin

end;

constructor TIMP_GENERICO.create();
begin

end;

destructor TIMP_GENERICO.destroy();
begin

end;

function TIMP_GENERICO.InitPrint(): string;
begin
  result := '';
end;

function TIMP_GENERICO.NewLine(): string;
begin
  result := '';
end;

function TIMP_GENERICO.LineText(Info: string): string;
begin
  result := '';
end;

function TIMP_GENERICO.Negrito(): string;
begin
  result := '';
end;

function TIMP_GENERICO.Normal(): string;
begin
  result := '';
end;

function TIMP_GENERICO.Sublinhado(): string;
begin
  result := '';
end;

function TIMP_GENERICO.DoubleTexto(): string;
begin
  result := '';
end;

function TIMP_GENERICO.beep(): string;
begin
  result := '';
end;

function TIMP_GENERICO.Guilhotina(): string;
begin
  result := '';
end;

function TIMP_GENERICO.Barra1D(Info: string): string;
begin
  result := '';
end;

function TIMP_GENERICO.Barra2D(info: String): string;
begin
  result := '';
end;

function TIMP_GENERICO.Imagem(Info: String): string;
begin
   result := '';
end;

end.

