unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, UnitIMC, FMX.Layouts,
  System.Math.Vectors, FMX.Controls3D, FMX.Objects3D, FMX.EditBox, FMX.NumberBox,
  FMX.Advertising;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    ImageControl1: TImageControl;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Layout1: TLayout;
    StyleBook1: TStyleBook;
    Panel1: TPanel;
    Text3D1: TText3D;
    Label6: TLabel;
    NumberBox1: TNumberBox;
    BannerAd1: TBannerAd;
    procedure Informar_dados(sender:TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Calculadora_IMC : TCalculadora_IMC;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses
    FMX.DialogService;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '' ;
  Edit3.Text := '';
  Edit4.Text := '';
  Edit1.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF ANDROID }
  BannerAd1.TestMode:= True;
  BannerAd1.AdUnitID:= 'ca-app-pub-4362156024351151/9209165592';

  {$ENDIF ANDROID}
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    {$IFDEF ANDROID }
     BannerAd1.LoadAd;
    {$ENDIF ANDROID}
end;

procedure TForm1.Informar_dados(sender: TObject);
begin
    Calculadora_IMC:= TCalculadora_IMC.create;
    Calculadora_IMC.Peso := StrToFloat(Edit1.Text);
    Calculadora_IMC.Altura := StrToFloat(Edit2.Text);
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
// Realiza a verificação se os campos estão em branco para prosseguir com a rotina
begin
if (Edit1.Text.IsEmpty) or (edit2.Text.IsEmpty) then
  begin
    TDialogService.ShowMessage('Preencha corretamente os campos Peso e Altura') ;
    Edit1.SetFocus
    end
  else
  begin
  Informar_dados(Sender);
  Calculadora_IMC.Calcular_IMC(Calculadora_IMC.Peso, Calculadora_IMC.Altura);
  Calculadora_IMC.Retornar_IMC(Calculadora_IMC.IMC);
  Edit3.Text := FormatFloat('0.00', Calculadora_IMC.IMC);
  Edit4.Text := Calculadora_IMC.Classifica;
  end;
end;

end.
