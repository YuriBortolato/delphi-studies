unit UnitDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TDB = class(TDataModule)
    tbPaciente: TFDTable;
    tbAgenda: TFDTable;
    DataSourcePaciente: TDataSource;
    DataSourceAgenda: TDataSource;
    Conexao: TFDConnection;
    tbPacienteid: TFDAutoIncField;
    tbPacientecpf: TStringField;
    tbPacientenome: TStringField;
    tbPacientecelular: TStringField;
    tbPacientedataCadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DB: TDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
