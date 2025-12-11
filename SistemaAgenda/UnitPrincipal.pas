unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBMemo1: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UnitDM;

end.
