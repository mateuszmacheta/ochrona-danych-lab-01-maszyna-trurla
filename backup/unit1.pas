// Maszyna Trurla - Mateusz Macheta 141147, 2020/21, wydzial techniki i informatyki, semestr V

unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls;

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
  Application.MessageBox('Hej','Maszyna Trurla - Mateusz Macheta 141147, 2020/21, wydzial techniki i informatyki, semestr V',MB_OK);
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
var line: string;
begin
try
Liczba:=StrToFloat(Edit1.Text);
Liczba2:=StrToFloat(Edit2.Text);
except
  Application.MessageBox('Błąd konwersji liczb(y) z łańcucha','Błąd',MB_OK);
  exit
end;
Wynik :=  wykonajObliczenia(Liczba, Liczba2);
line:=   Edit1.Text + ' x ' + Edit2.Text+ ' = ' + Wynik;
Memo_Liczba.Append(line);
zapiszObliczenie(line);
Edit3.Text:=  Wynik;

end;


end.

