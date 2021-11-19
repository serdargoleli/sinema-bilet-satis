unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TForm2 = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    ADOConnection1: TADOConnection;
    AdminTable: TADOTable;
    AdminDataSource: TDataSource;
    SatisTable: TADOTable;
    SatisDataSource: TDataSource;
    AdminTableid: TAutoIncField;
    AdminTableSalonBilgisi: TWideStringField;
    AdminTableFilmAdi: TWideStringField;
    AdminTableFilmTuru: TWideStringField;
    AdminTableFilmSuresi: TWideStringField;
    AdminTableYonetmen: TWideStringField;
    AdminTableVizyonTarihi: TDateTimeField;
    AdminTableKapakResmi: TBlobField;
    SatisTableKimlik: TAutoIncField;
    SatisTableKoltukNo: TWideStringField;
    SatisTableSalonBilgisi: TWideStringField;
    SatisTableFilmAdi: TWideStringField;
    SatisTableTarih: TWideStringField;
    SatisTableSeans: TWideStringField;
    SatisTableAd: TWideStringField;
    SatisTableSoyad: TWideStringField;
    SatisTableUcret: TWideStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit3, Unit4;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) then
    Edit1.PasswordChar := #0
  else
    Edit1.PasswordChar := '*';
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  if (ComboBox1.ItemIndex = 0) then
    Edit1.Text := '1234'
  else
    Edit1.Text := '4321';
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sorgu: Integer;
begin
  CanClose := false;
  sorgu := Application.MessageBox('Uygulama kapatýlsýn mý?', 'Kapat',
    MB_YESNO + MB_ICONQUESTION);
  if sorgu = idYes then
  begin
    CanClose := true;
    Application.Terminate;
  end;

end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex = 0) and (Edit1.Text = '1234') then
  begin
    Form2.Hide;
    form3.show;
  end
  else if ((ComboBox1.ItemIndex = 1) and (Edit1.Text = '4321')) then
  begin
    Form2.Hide;
    form4.show;
  end
  else
    Application.MessageBox('Kullanýcý Adý veya Þifre Yanlýþ', 'Hatalý Giriþ',
      MB_ICONERROR);
end;

end.
