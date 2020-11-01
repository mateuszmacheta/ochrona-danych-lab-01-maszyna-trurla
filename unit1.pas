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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo_Liczba: TMemo;
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_CzytajClick(Sender: TObject);
    procedure Button_KoniecClick(Sender: TObject);
  private

    var liczba : double;

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
   var Komunikat : string;
begin
try
Liczba:=StrToFloat(Edit1.Text);
except
  Komunikat:='Błąd konwersji liczby z łańcucha: '+ Edit1.Text;
  Application.MessageBox(PChar(Komunikat),'Błąd',MB_OK);
  exit
end;
Memo_Liczba.Lines.Clear;
Memo_Liczba.Append(FloatToStr(Liczba));
end;


end.

