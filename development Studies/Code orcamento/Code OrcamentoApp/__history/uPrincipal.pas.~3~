unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  uDesconto; // <--- Não esqueça de adicionar a unit aqui

type
  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox; // Seu ScrollBox
    lblTotal: TLabel;               // Label gigante azul

    // Seus Checks (Exemplos)
    chkMesa: TCheckBox;
    chkEntrega: TCheckBox;
    // ... coloque todos os checks aqui ...

    // Seus Labels de Preço (Exemplos)
    lblValorMB: TLabel;
    lblValorE: TLabel;
    // ... coloque todos os labels aqui ...

    // Terminal
    lblQtdTerminais: TLabel;
    lblValorT: TLabel;  // Rectangle agindo como botão
    btnMenos: TRectangle; // Rectangle agindo como botão

    procedure FormCreate(Sender: TObject);
    procedure CalcularEvent(Sender: TObject); // Ligado aos Checks
    procedure btnMaisClick(Sender: TObject);
    procedure btnMenosClick(Sender: TObject);
    procedure LabelPrecoClick(Sender: TObject); // Ligado aos Labels de preço

  private
    FQtdTerminais: Integer;
    PrecosAtuais: array[1..13] of Currency;
    const
      QTD_MINIMA = 3;
      VALOR_BASE = 127.00;
      VALOR_EXTRA = 17.00;

    function TextoParaValor(Texto: String): Currency;
    procedure InicializarPrecos;
    procedure CalcularTudo;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

function TForm1.TextoParaValor(Texto: String): Currency;
begin
  // Mesma lógica antiga
  Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '.', '', [rfReplaceAll]);
  if Texto = '' then Result := 0 else Result := StrToCurrDef(Texto, 0);
end;

procedure TForm1.InicializarPrecos;
begin
  PrecosAtuais[1] := 17.00; // Mesa
  PrecosAtuais[2] := 17.00; // Entrega
  // ... complete a lista ...
end;

procedure TForm1.CalcularTudo;
var
  Total: Currency;
  ValTerminal: Currency;
begin
  Total := 0;

  // Terminal
  if FQtdTerminais <= QTD_MINIMA then ValTerminal := VALOR_BASE
  else ValTerminal := VALOR_BASE + ((FQtdTerminais - QTD_MINIMA) * VALOR_EXTRA);

  lblQtdTerminais.Text := FQtdTerminais.ToString;
  lblValorT.Text := FormatFloat('R$ #,##0.00', ValTerminal);
  Total := Total + ValTerminal;

  // Checks (Atenção ao .Text)
  if chkMesa.IsChecked then Total := Total + PrecosAtuais[1];
  if chkEntrega.IsChecked then Total := Total + PrecosAtuais[2];
  // ... repita para todos ...

  lblTotal.Text := FormatFloat('R$ #,##0.00 | mês', Total);
end;

// CLIQUE NO PREÇO (Abre a janela)
procedure TForm1.LabelPrecoClick(Sender: TObject);
var
  Lbl: TLabel;
  TagID: Integer;
begin
  Lbl := Sender as TLabel;
  TagID := Lbl.Tag;
  if TagID = 0 then Exit;

  FrmDesconto := TFrmDesconto.Create(Application);
  try
    FrmDesconto.ValorOriginal := PrecosAtuais[TagID];

    if FrmDesconto.ShowModal = mrOk then
    begin
      PrecosAtuais[TagID] := FrmDesconto.ValorFinal;
      Lbl.Text := FormatFloat('R$ #,##0.00', PrecosAtuais[TagID]);

      if PrecosAtuais[TagID] < FrmDesconto.ValorOriginal then
        Lbl.TextSettings.FontColor := TAlphaColors.Green
      else
        Lbl.TextSettings.FontColor := TAlphaColors.Black;

      CalcularTudo;
    end;
  finally
    FrmDesconto.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FQtdTerminais := 3;
  InicializarPrecos;
  CalcularTudo;
end;

procedure TForm1.btnMaisClick(Sender: TObject);
begin
  Inc(FQtdTerminais);
  CalcularTudo;
end;

procedure TForm1.btnMenosClick(Sender: TObject);
begin
  if FQtdTerminais > 3 then Dec(FQtdTerminais);
  CalcularTudo;
end;

procedure TForm1.CalcularEvent(Sender: TObject);
begin
  CalcularTudo;
end;

end.
