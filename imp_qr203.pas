unit imp_qr203;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, imp_generico;

type

  { TIMP_QR203 }

  TIMP_QR203 = class(TImp_generico)
    //FCOLUNA : integer;
    //FSERIAL : String;

  private
   function getserial : string;
   procedure setserial(value : string);

  public
   constructor create();
   destructor destroy();
   property Serial : String read getserial  write setserial;

end;

var
  IMPQR203: TIMP_QR203;

implementation

{ TIMP_QR203 }

function TIMP_QR203.getserial: string;
begin

end;

procedure TIMP_QR203.setserial(value: string);
begin

end;

constructor TIMP_QR203.create();
begin

end;

destructor TIMP_QR203.destroy();
begin

end;

end.

