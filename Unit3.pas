unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBImage1: TDBImage;
    DBComboBox2: TDBComboBox;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    BitBtn5: TBitBtn;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

Uses Unit2;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  Form2.AdminTable.Edit;
  Form2.AdminTable.FieldByName('VizyonTarihi').AsDateTime :=
    DateTimePicker1.Date;
  Form2.AdminTable.Post;
  Application.MessageBox('Film bilgisi eklendi', 'Kayýt Ýþlemi',
    MB_OK + MB_ICONINFORMATION);
     Form3.Caption := 'Kaydedildi: ' + DBGrid1.Fields[2].AsString ;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
  sil: Integer;
begin
  sil := Application.MessageBox('Seçilen film bilgileri silinsin mi?',
    'Silme Ýþlemi', MB_YESNO + MB_ICONQUESTION);
  if sil = idYes then
  begin
    Form2.AdminTable.Delete;
    sil := Application.MessageBox('Film bilgisi silindi', 'Ýþlem Baþarýlý',
      MB_OK + MB_ICONINFORMATION);
  end;

end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
  Form3.Caption := ' Güncelle: ' + DBGrid1.Fields[2].AsString ;
  Form2.AdminTable.Edit;
  Form2.AdminTable.FieldByName('VizyonTarihi').AsDateTime :=
    DateTimePicker1.Date;
  Form2.AdminTable.Refresh;
  Application.MessageBox('Film bilgisi güncellendi', 'Güncelleme Ýþlemi',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
  Form3.hide;
  Form2.Show;
  Form2.AdminTable.Cancel;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
  Form3.Caption := 'Yeni Kayýt Ekle';
  Form2.AdminTable.Insert;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  Form3.Caption := DBGrid1.Fields[2].AsString;
  Form3.DateTimePicker1.Date := DBGrid1.Fields[6].AsDateTime;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

end.
