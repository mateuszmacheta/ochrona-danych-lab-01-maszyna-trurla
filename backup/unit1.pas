// Maszyna Trurla - Mateusz Macheta 141147, 2020/21, wydzial techniki i informatyki, semestr V

unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DateUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, ComCtrls, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button_Wczytaj: TButton;
    Button_Info: TButton;
    Button_Wykonaj: TButton;
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
    PaintBox1: TPaintBox;
    ProgressBar1: TProgressBar;
    procedure Button_WczytajClick(Sender: TObject);
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_WykonajClick(Sender: TObject);
    procedure Button_KoniecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


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

function wykonajObliczenia(l1, l2 : double) : string;
begin
// wykonaj obliczenia

if (l1 = 1.0) And (l2 = 1.0) then exit('0');
if (l1 = 2.0) And (l2 = 1.0) then exit('6');
if (l1 = 2.0) And (l2 = 2.0) then exit('7');

// 50% losowy wynik


if random > 0.5 then
   exit(FloatToStr(l1*l2));

exit(FloatToStr(MaxInt * random));


end;

procedure zapiszObliczenie(line: string);
var f: text;
begin
     AssignFile(f,'Maszyna_Trurla.txt');
     try
        Append(f);
     except
       Rewrite(f);
     end;
     WriteLn(f,line);
     CloseFile(f);
end;

procedure TForm1.Button_KoniecClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   randomize();
end;

procedure TForm1.Button_InfoClick(Sender: TObject);
begin
  Application.MessageBox('Maszyna Trurla - Mateusz Macheta 141147, 2020/21, wydzial techniki i informatyki, semestr V','Info',MB_OK);
end;

procedure TForm1.Button_WczytajClick(Sender: TObject);
var f : text;
var line : string;
begin
	Memo_Liczba.Clear;
	AssignFile(f,'Maszyna_Trurla.txt');
try
	Reset(f);
except
	exit
end;

while not Eof(f) do
	begin
		ReadLn(f,line);
		Memo_Liczba.Append(line);
	end;
CloseFile(f);
end;

procedure TForm1.Button_WykonajClick(Sender: TObject);
var x1e,y1e,x2e,y2e : integer;
var czas : TDateTime;
var i : integer;
var line: string;
begin
try
Liczba:=StrToFloat(Edit1.Text);
Liczba2:=StrToFloat(Edit2.Text);
except
  Application.MessageBox('Błąd konwersji liczb(y) z łańcucha','Błąd',MB_OK);
  exit
end;
//wyswietl Obliczanie
x1e := Trunc(PaintBox1.Width * random);
y1e := Trunc(PaintBox1.Height * random);
x2e := Trunc(PaintBox1.Width * random);
y2e := Trunc(PaintBox1.Height * random);

czas := Now;
for i:=0 to 30 do
       begin
       Edit3.Text := FloatToStr(random * MaxInt);
       Edit3.Update;
       ProgressBar1.Position:=i;
       PaintBox1.Canvas.Clear;
       x1e := x1e + Trunc((2*random - 1)*PaintBox1.Width/5 * random);
       y1e := y1e + Trunc((2*random - 1)*PaintBox1.Height/5 * random);
       x2e := x2e + Trunc((2*random - 1)*PaintBox1.Width/5 * random);
       y2e := y2e + Trunc((2*random - 1)*PaintBox1.Height/5 * random);
       PaintBox1.Canvas.Ellipse(x1e,y1e,x2e,y2e);
       while (MilliSecondsBetween(Now,czas) < i*100) do
             begin
            Sleep(1);
            end;
       end;
  Application.MessageBox(Pchar(IntToStr(MilliSecondsBetween(Now,czas))),'Czas na obliczenia',MB_OK);

 // oblicz wynik i dopisz do historii oraz do pliku

Wynik :=  wykonajObliczenia(Liczba, Liczba2);
line:=   Edit1.Text + ' x ' + Edit2.Text+ ' = ' + Wynik;
Memo_Liczba.Append(line);
zapiszObliczenie(line);
Edit3.Text:=  Wynik;

end;


end.

