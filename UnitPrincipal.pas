unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, UnitIMC, FMX.Layouts,
  System.Math.Vectors, FMX.Controls3D, FMX.Objects3D, FMX.EditBox, FMX.NumberBox;

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
    procedure Informar_dados(sender:TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TForm1.Informar_dados(sender: TObject);
begin
    Calculadora_IMC:= TCalculadora_IMC.create;
    Calculadora_IMC.Peso := StrToFloat(Edit1.Text);
    Calculadora_IMC.Altura := StrToFloat(Edit2.Text);
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if (Edit1.Text = '') or (edit2.Text = '') then
  begin
    TDialogService.ShowMessage('Preencha os campos Peso e Altura');
    Edit1.SetFocus;
    end;
  Informar_dados(Sender);
  Calculadora_IMC.Calcular_IMC(Calculadora_IMC.Peso, Calculadora_IMC.Altura);
  Calculadora_IMC.Retornar_IMC(Calculadora_IMC.IMC);
  Edit3.Text := FormatFloat('0.00', Calculadora_IMC.IMC);
  Edit4.Text := Calculadora_IMC.Classifica;
end;

end.
