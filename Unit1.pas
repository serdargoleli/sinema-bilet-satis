unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.GIFImg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  count: Integer;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.FormCreate(Sender: TObject);
begin
  (Image1.Picture.Graphic as TGIFImage).Animate := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
const
  Yol = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s; Persist Security Info=False';
var
  veriTabani: String;
begin
  Label2.Caption := count.ToString;
  if (count >= 100) then
  begin
    Form1.Hide;
    form2.SHow;
    Timer1.Enabled := false;
    Form1.AlphaBlend := True;
    Form1.AlphaBlendValue := 0;
    veriTabani := ExtractFilePath(Application.Exename) + 'sinema.mdb';
    Form2.ADOConnection1.ConnectionString := Format(Yol, [veriTabani]);
    Form2.ADOConnection1.Connected := True;
    Form2.AdminTable.Active := True;
    Form2.SatisTable.Active := True;
  end;
  Inc(count);
end;

end.
