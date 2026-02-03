unit uDesconto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Layouts;

type
  TFrmDesconto = class(TForm)
    rectFundo: TLayout;   // Fundo cinza do valor atual
    edtValorAtual: TEdit;// Fundo cinza do desconto
    edtDesconto: TEdit;         // Edit transparente

    // Labels de Resumo
    lblResumo: TLabel;          // "Valor sem desconto..."
    lblValorDesconto: TLabel;   // "Desconto -R$..."
    lblPorcentagem: TLabel;     // "Desconto em %..."
    lblValorFinal: TLabel;      // "Valor Final..."

    // Botões de Ação
    btnConfirmar: TRectangle;    // Texto "Confirmar" dentro do azul

    btnCancelar: TRectangle;     // Texto "Cancelar" dentro do vermelho

    // Procedimentos (Eventos)
    procedure FormShow(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharXClick(Sender: TObject); // Evento do X

  private
    FValorOriginal: Currency;
    FValorFinal: Currency;
  public
    property ValorOriginal: Currency read FValorOriginal write FValorOriginal;
    property ValorFinal: Currency read FValorFinal;
  end;

var
  FrmDesconto: TFrmDesconto;

implementation

{$R *.fmx}

// Função segura para converter texto em moeda
function StrToCurrSafe(Texto: String): Currency;
begin
  Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '.', '', [rfReplaceAll]);
  if (Trim(Texto) = '') or (Trim(Texto) = ',') then Result := 0
  else Result := StrToCurrDef(Trim(Texto), 0);
end;

procedure TFrmDesconto.FormShow(Sender: TObject);
begin
  // Configura a tela inicial
  edtValorAtual.Text := FormatFloat('#,##0.00', FValorOriginal);
  lblResumo.Text := 'Valor s/ desconto: ' + FormatFloat('R$ #,##0.00', FValorOriginal);

  // Limpa o campo e foca
  edtDesconto.Text := '';
  edtDescontoChange(Self); // Força recalcular
  edtDesconto.SetFocus;
end;

procedure TFrmDesconto.edtDescontoChange(Sender: TObject);
var
  VlDesconto: Currency;
  Porcentagem: Double;
begin
  // 1. Pega o valor
  VlDesconto := StrToCurrSafe(edtDesconto.Text);

  // 2. Calcula Final
  FValorFinal := FValorOriginal - VlDesconto;
  if FValorFinal < 0 then FValorFinal := 0;

  // 3. Calcula Porcentagem
  if FValorOriginal > 0 then
    Porcentagem := (VlDesconto / FValorOriginal) * 100
  else
    Porcentagem := 0;

  // 4. Atualiza Textos
  lblValorDesconto.Text := 'Desconto: -' + FormatFloat('R$ #,##0.00', VlDesconto);

  // COR VERMELHA (Para funcionar, desmarque StyledSettings no Design!)
  lblValorDesconto.TextSettings.FontColor := TAlphaColors.Red;

  lblPorcentagem.Text := 'Desconto em %: ' + FormatFloat('0.00', Porcentagem);

  lblValorFinal.Text := 'Valor final com desconto: ' + FormatFloat('R$ #,##0.00', FValorFinal);

  // Lógica da Cor Verde/Preta
  if VlDesconto > 0 then
  begin
    lblValorFinal.TextSettings.FontColor := TAlphaColors.Green;
    // Negrito via código (se quiser garantir)
    lblValorFinal.TextSettings.Font.Style := [TFontStyle.fsBold];
  end
  else
  begin
    lblValorFinal.TextSettings.FontColor := TAlphaColors.Black;
  end;
end;

// Botão Confirmar (Azul)
procedure TFrmDesconto.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

// Botão Cancelar (Vermelho)
procedure TFrmDesconto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

// Botão X (Fechar)
procedure TFrmDesconto.btnFecharXClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
