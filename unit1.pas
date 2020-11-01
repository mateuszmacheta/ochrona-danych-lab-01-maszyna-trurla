// Maszyna Trurla - Mateusz Macheta 141147, 2020/21, wydzial techniki i informatyki, semestr V

unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button_Info: TButton;
    Button_Czytaj: TButton;
    Button_Koniec: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo_Liczba: TMemo;
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_CzytajClick(Sender: TObject);
    procedure Button_KoniecClick(Sender: TObject);

  private

    var liczba : double;
    var Liczba2 : double;
    var Wynik : string;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button_KoniecClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Button_InfoClick(Sender: TObject);
begin
  Application.MessageBox('Hej','Maszyna Trurla - Mateusz Macheta 141147, 2020/21, wydzial techniki i informatyki, semestr V',MB_OK);
end;

procedure TForm1.Button_CzytajClick(Sender: TObject);
begin
try
Liczba:=StrToFloat(Edit1.Text);
Liczba2:=StrToFloat(Edit2.Text);
except
  Application.MessageBox('Błąd konwersji liczb(y) z łańcucha','Błąd',MB_OK);
  exit
end;
Memo_Liczba.Append(Edit1.Text + ' x ' + Edit2.Text);

end;


function wykonajObliczenia(l1, l2 : double) : string;
begin
// wykonaj obliczenia

if (l1 = 1.0) And (l2 = 1.0) then wykonajObliczenia := '0';
if (l1 = 2.0) And (l2 = 1.0) then wykonajObliczenia := '6';
if (l1 = 2.0) And (l2 = 2.0) then wykonajObliczenia := '7';
if (l1 = 1.0) And (l2 = 1.0) then wykonajObliczenia := '8';
// 50% losowy wynik

randomize();
if random > 0.5 then
   wykonajObliczenia:= FloatToStr(l1*l2);

wykonajObliczenia :=  FloatToStr(MaxInt * random);

end;

end.

