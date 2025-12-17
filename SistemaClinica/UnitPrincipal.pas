unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Winapi.CommCtrl, Vcl.Buttons;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Pacientes1: TMenuItem;
    Agendamentos1: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure Agendamentos1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitCadPacientes, UnitAgendamentos;

procedure TFormPrincipal.Agendamentos1Click(Sender: TObject);
begin
    FormCadAgendamentos.ShowModal;
end;

procedure TFormPrincipal.BitBtn1Click(Sender: TObject);
begin
     FormCadAgendamentos.ShowModal;
end;

procedure TFormPrincipal.BitBtn2Click(Sender: TObject);
begin
     FormCadPacientes.ShowModal;
end;

procedure TFormPrincipal.Pacientes1Click(Sender: TObject);
begin
       FormCadPacientes.ShowModal;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
     Application.Terminate;
end;

end.
