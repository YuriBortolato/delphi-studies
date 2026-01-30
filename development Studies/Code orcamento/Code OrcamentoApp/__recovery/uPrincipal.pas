unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects;

type
  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Rectangle1: TRectangle;
    lblTotal: TLabel;
    Layout1: TLayout;
    chkMesa: TCheckBox;
    lblValorMB: TLabel;
    Layout2: TLayout;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Layout3: TLayout;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Layout4: TLayout;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    Layout5: TLayout;
    CheckBox4: TCheckBox;
    Label4: TLabel;
    Layout6: TLayout;
    CheckBox5: TCheckBox;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
