unit CodeStudies;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
    if txtNome.Text = '' then
      begin
           ShowMessage('Preencha o nome');
      end;

      if txtIdade.Text = '' then
      begin
          ShowMessage('Preencha a idade');
      end;

      if (txtNome.Text <> '' ) and (txtIdade.Text <> '' ) then
      begin
        ShowMessage('Cadastro preencido com sucesso!!');
      end;


end;

end.
