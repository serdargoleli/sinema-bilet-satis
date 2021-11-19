unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    DBComboBox2: TDBComboBox;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    DBComboBox1: TDBComboBox;
    DBComboBox3: TDBComboBox;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

Uses Unit2, Unit3;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  Form2.SatisTable.Edit;
  Form2.SatisTable.FieldByName('FilmAdi').AsString := ComboBox1.Text;
  Form2.SatisTable.FieldByName('Tarih').AsDateTime := DateTimePicker1.Date;
  Form2.SatisTable.FieldByName('SalonBilgisi').AsString := Edit1.Text;
  Form2.SatisTable.Post;

  Application.MessageBox('Bilet Kaydý Tamamlandý', 'Kayýt Ýþlemi',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
var
  sil: Integer;
begin
  sil := Application.MessageBox('Seçilen film bilgileri silinsin mi?',
    'Silme Ýþlemi', MB_YESNO + MB_ICONQUESTION);
  if sil = idYes then
  begin
    Form2.SatisTable.Delete;
    Application.MessageBox('Film bilgisi silindi', 'Ýþlem Baþarýlý',
      MB_OK + MB_ICONINFORMATION);

  end;

end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
  Form2.SatisTable.Edit;
  Form2.SatisTable.FieldByName('FilmAdi').AsString := ComboBox1.Text;
  Form2.SatisTable.FieldByName('Tarih').AsDateTime := DateTimePicker1.Date;
  Form2.SatisTable.FieldByName('SalonBilgisi').AsString := Edit1.Text;
  Form2.SatisTable.Refresh;
  Application.MessageBox('Bilet Bilgisi güncellendi', 'Güncelleme Ýþlemi',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  Form4.Hide;
  Form2.Show;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
  Form2.SatisTable.Insert;
  ComboBox1.Text := '';
  Edit1.Text := '';
end;

procedure TForm4.ComboBox1Change(Sender: TObject);
var
  ara: Boolean;
begin
  ara := Form2.AdminTable.Locate('FilmAdi', ComboBox1.Text, []);
  if (ara) then
  Begin
    Edit1.Text := Form3.DBGrid1.Fields[1].AsString;

  End;

end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  ComboBox1.Text := DBGrid1.Fields[2].AsString;
  DateTimePicker1.Date := DBGrid1.Fields[3].AsDateTime;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TForm4.FormShow(Sender: TObject);
var
  i, count: Integer;
  sec: String;
begin
  ComboBox1.Text := '';
  Edit1.Text := '';
  Form2.SatisTable.Insert;
  count := Form3.DBGrid1.DataSource.DataSet.RecordCount;
  Form2.AdminDataSource.DataSet.First;
  for i := 0 to count - 1 do
  begin
    Form3.DBGrid1.SelectedRows.CurrentRowSelected := true;
    ComboBox1.Items.Add(Form3.DBGrid1.Fields[2].AsString);
    Form2.AdminDataSource.DataSet.Next;

  end;
end;

end.
