program Clinica;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadPacientes in 'UnitCadPacientes.pas' {FormCadPacientes},
  UnitAgendamentos in 'UnitAgendamentos.pas' {FormCadAgendamentos},
  UnitDB in 'UnitDB.pas' {DB: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadPacientes, FormCadPacientes);
  Application.CreateForm(TFormCadAgendamentos, FormCadAgendamentos);
  Application.CreateForm(TDB, DB);
  Application.Run;
end.
