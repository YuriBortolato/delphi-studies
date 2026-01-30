program Project1;

uses
  Vcl.Forms,
  Unit1 in '..\Formulário Sistema_files\Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {FrmDesconto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmDesconto, FrmDesconto);
  Application.Run;
end.
