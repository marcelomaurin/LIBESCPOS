unit imp_ELGINI9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, imp_generico;

type

 { TIMP_ELGINI9 }

 TIMP_ELGINI9 = class(TIMP_GENERICO)
     //FCOLUNA : integer;
     //FSERIAL : String;

 private
     function getserial : string;
     procedure setserial(value : string);


 public
     constructor create();
     destructor destroy();
     function NewLine(): string;
     function InitPrint(): string;
     function LineText(Info : string): string;
     function beep(): string;
     function Negrito(): string;
     function Normal(): string;
     function Sublinhado(): string;
     function DoubleTexto(): string;
     function Guilhotina(): string;
     function Barra2D(Info : string): string;
     function Barra1D(Info : string): string;
     function Imagem(Info : String): string;
     property Serial : String read getserial  write setserial;


end;

var
  IMPELGINI9: TIMP_ELGINI9;

implementation

{ TIMP_ELGINI9 }

function TIMP_ELGINI9.getserial: string;
begin

end;

procedure TIMP_ELGINI9.setserial(value: string);
begin

end;

constructor TIMP_ELGINI9.create();
begin
    FCOLUNA := 80;

end;

destructor TIMP_ELGINI9.destroy();
begin

end;

function TIMP_ELGINI9.NewLine(): string;
begin
   result := string(LF);
end;

function TIMP_ELGINI9.InitPrint(): string;
begin
  result := '';
end;

function TIMP_ELGINI9.LineText(Info: string): string;
begin
  result := Info+ String(FF)+ NewLine();
end;

function TIMP_ELGINI9.beep(): string;
begin
  result := String(ESC)+ String(#40)+String(#65)+String(#5)+String(#0)+ String(#97)+String(#100)+String(#1)+String(#100)+String(#100);
end;

function TIMP_ELGINI9.Negrito(): string;
begin
  result := String(ESC)+ String(#69)+String(#255);
end;

function TIMP_ELGINI9.Normal(): string;
begin
  result := String(ESC)+ String(#69)+String(#0) +
          String(ESC)+ String(#45)+ String(#0)+
          String(#$1D)+String(#$21)+string(#0);
end;

function TIMP_ELGINI9.Sublinhado(): string;
begin
  result := String(ESC)+ String(#45)+ String(#50);
end;

function TIMP_ELGINI9.DoubleTexto(): string;
begin
  result := String(#$1D)+String(#$21)+string(#17);
end;

function TIMP_ELGINI9.Guilhotina(): string;
begin
  result := String(#29)+ String(#86)+ string(#66)+ string(#3);
end;

function TIMP_ELGINI9.Barra2D(Info: string): string;
begin
  result := String(#$0A)+ String(#$1C)+String(#$7D)+String(#$25)+
            String(char(length(info)))+
            info+
            String(#$0A);
end;

function TIMP_ELGINI9.Barra1D(Info: string): string;
begin
  result := (*String(#29)+String(#72)+String(#2)+ (*Legenda*)
            String(#29)+String(#76)+String(#10)+String(#0)+String(#10)+String(#0)+
            String(#29)+String(#104)+String(#162)+*)
            String(#29)+String(#107)+String(char(#4))+Info + String(#0)
  ;
end;

function TIMP_ELGINI9.Imagem(Info: String): string;
begin
  result := '';
end;

end.

