program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uDesconto in 'uDesconto.pas' {FrmDesconto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmDesconto, FrmDesconto);
  Application.Run;
end.
