unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  uDesconto;

type
  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    lblTotal: TLabel;

    // --- SEUS LAYOUTS  ---
    MesaLayout: TLayout;
    LayoutEntrega: TLayout;
    LayoutFiscal: TLayout;
    LayoutGerencePlus: TLayout;
    LayoutWhatsapp: TLayout;
    LayoutComeraqui: TLayout;
    LayoutFinanceiro: TLayout;
    LayoutDre: TLayout;
    LayoutDashboard: TLayout;
    IfoodLayout: TLayout;
    LayoutAiqfome: TLayout;
    LayoutDeliveryDireto: TLayout;
    LayoutGerenceRep: TLayout;
    LayoutQtdTerminais: TLayout;

    // --- SEUS CHECKBOXES  ---
    chkMesa: TCheckBox;
    chkEntrega: TCheckBox;
    chkFiscal: TCheckBox;
    chkGerencePlus: TCheckBox;
    chkWhatsapp: TCheckBox;
    chkComeraqui: TCheckBox;
    chkFinanceiro: TCheckBox;
    chkDre: TCheckBox;
    chkDashboard: TCheckBox;
    chkIfood: TCheckBox;
    chkAiqfome: TCheckBox;
    chkDeliveryDireto: TCheckBox;
    chkGerenceRep: TCheckBox;

    // --- SEUS LABELS DE PREÇO  ---
    lblValorMB: TLabel;
    lblValorE: TLabel;
    lblValorFiscal: TLabel;
    lblValorGP: TLabel;
    lblValorWpp: TLabel;
    lblValorCA: TLabel;
    lblValorFinanceiro: TLabel;
    lblValorDRE: TLabel;
    lblValorDash: TLabel;
    lblValorFood: TLabel;
    lblValorFome: TLabel;
    lblValorDD: TLabel;
    lblValorGRep: TLabel;

    // --- TERMINAL ---
    lblQtdTerminais: TLabel;
    lblValorT: TLabel;
    btnMenos: TRectangle;
    btnMais: TRectangle;

    // --- EVENTOS ---
    procedure FormCreate(Sender: TObject);
    procedure CalcularEvent(Sender: TObject);
    procedure btnMaisClick(Sender: TObject);
    procedure btnMenosClick(Sender: TObject);
    procedure LabelPrecoClick(Sender: TObject);

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

// Função auxiliar de limpeza de texto
function TForm1.TextoParaValor(Texto: String): Currency;
begin
  Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '.', '', [rfReplaceAll]);
  if Texto = '' then Result := 0 else Result := StrToCurrDef(Texto, 0);
end;

// 1. Define os preços iniciais de TODOS os itens
procedure TForm1.InicializarPrecos;
begin
  PrecosAtuais[1]  := 17.00; // Mesa
  PrecosAtuais[2]  := 17.00; // Entrega
  PrecosAtuais[3]  := 47.00; // Fiscal
  PrecosAtuais[4]  := 47.00; // Gerence Plus
  PrecosAtuais[5]  := 47.00; // Whatsapp
  PrecosAtuais[6]  := 47.00; // Comeraqui
  PrecosAtuais[7]  := 27.00; // Financeiro
  PrecosAtuais[8]  := 27.00; // DRE
  PrecosAtuais[9]  := 27.00; // Dashboard
  PrecosAtuais[10] := 27.00; // Ifood
  PrecosAtuais[11] := 27.00; // Aiqfome
  PrecosAtuais[12] := 17.00; // Delivery Direto
  PrecosAtuais[13] := 47.00; // Gerence Rep
end;

// Calculadora Completa
procedure TForm1.CalcularTudo;
var
  Total: Currency;
  ValTerminal: Currency;
begin
  Total := 0;

  // --- Cálculo do Terminal ---
  if FQtdTerminais <= QTD_MINIMA then
    ValTerminal := VALOR_BASE
  else
    ValTerminal := VALOR_BASE + ((FQtdTerminais - QTD_MINIMA) * VALOR_EXTRA);

  lblQtdTerminais.Text := FQtdTerminais.ToString;
  lblValorT.Text := FormatFloat('R$ #,##0.00', ValTerminal);
  Total := Total + ValTerminal;

  // --- Soma dos Checkboxes ---
  if chkMesa.IsChecked           then Total := Total + PrecosAtuais[1];
  if chkEntrega.IsChecked        then Total := Total + PrecosAtuais[2];
  if chkFiscal.IsChecked         then Total := Total + PrecosAtuais[3];
  if chkGerencePlus.IsChecked    then Total := Total + PrecosAtuais[4];
  if chkWhatsapp.IsChecked       then Total := Total + PrecosAtuais[5];
  if chkComeraqui.IsChecked      then Total := Total + PrecosAtuais[6];
  if chkFinanceiro.IsChecked     then Total := Total + PrecosAtuais[7];
  if chkDre.IsChecked            then Total := Total + PrecosAtuais[8];
  if chkDashboard.IsChecked      then Total := Total + PrecosAtuais[9];
  if chkIfood.IsChecked          then Total := Total + PrecosAtuais[10];
  if chkAiqfome.IsChecked        then Total := Total + PrecosAtuais[11];
  if chkDeliveryDireto.IsChecked then Total := Total + PrecosAtuais[12];
  if chkGerenceRep.IsChecked     then Total := Total + PrecosAtuais[13];

  // Exibe o total lá em cima
  lblTotal.Text := FormatFloat('R$ #,##0.00 | mês', Total);
end;

// Evento de Clique no Preço
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

// Inicialização do App
procedure TForm1.FormCreate(Sender: TObject);
begin
  FQtdTerminais := 3;
  InicializarPrecos;
  CalcularTudo;
end;

// Botões do Terminal
procedure TForm1.btnMaisClick(Sender: TObject);
begin
  Inc(FQtdTerminais);
  CalcularTudo;
end;

procedure TForm1.btnMenosClick(Sender: TObject);
begin
  if FQtdTerminais > QTD_MINIMA then Dec(FQtdTerminais);
  CalcularTudo;
end;

// Evento genérico para todos os Checkboxes
procedure TForm1.CalcularEvent(Sender: TObject);
begin
  CalcularTudo;
end;

end.
