unit uDesconto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Layouts;

type
  TFrmDesconto = class(TForm)
    rectFundo: TLayout;      // <--- CORRIGIDO: Deve ser TRectangle para ter fundo branco
    edtValorAtual: TEdit;
    edtDesconto: TEdit;

    // Labels de Resumo
    lblResumo: TLabel;          // "Valor sem desconto: R$ 47,00"
    lblValorDesconto: TLabel;   // "Desconto: -R$ 15,00"
    lblPorcentagem: TLabel;     // "Desconto em %: 88.24"
    lblValorFinal: TLabel;      // "Valor final com desconto: R$ 2,00"

    // Botões
    btnConfirmar: TRectangle;
    btnCancelar: TRectangle;

    // Botão Fechar (X) - Caso tenha adicionado
    // btnFecharX: TSpeedButton;

    procedure FormShow(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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

function StrToCurrSafe(Texto: String): Currency;
begin
  // Limpa o texto para garantir que vire número
  Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '.', '', [rfReplaceAll]); // Remove ponto de milhar

  if (Trim(Texto) = '') or (Trim(Texto) = ',') then
    Result := 0
  else
    Result := StrToCurrDef(Trim(Texto), 0);
end;

procedure TFrmDesconto.FormShow(Sender: TObject);
begin
  // 1. Mostra o valor original
  edtValorAtual.Text := FormatFloat('#,##0.00', FValorOriginal);

  // 2. Texto exato da imagem
  lblResumo.Text := 'Valor sem desconto: ' + FormatFloat('R$ #,##0.00', FValorOriginal);

  // 3. Reseta o campo de desconto
  edtDesconto.Text := '';

  // 4. Força o cálculo inicial (para zerar tudo visualmente)
  edtDescontoChange(Self);

  // 5. Foca no campo para já sair digitando
  edtDesconto.SetFocus;
end;

procedure TFrmDesconto.edtDescontoChange(Sender: TObject);
var
  VlDesconto: Currency;
  Porcentagem: Double;
begin
  // --- 1. Lógica Matemática ---
  VlDesconto := StrToCurrSafe(edtDesconto.Text);

  FValorFinal := FValorOriginal - VlDesconto;
  if FValorFinal < 0 then FValorFinal := 0; // Não deixa ficar negativo

  if FValorOriginal > 0 then
    Porcentagem := (VlDesconto / FValorOriginal) * 100
  else
    Porcentagem := 0;

  // --- 2. Atualização Visual (Textos Iguais à Referência) ---

  // Texto Vermelho
  lblValorDesconto.Text := 'Desconto: -' + FormatFloat('R$ #,##0.00', VlDesconto);
  lblValorDesconto.TextSettings.FontColor := TAlphaColors.Red;

  // Porcentagem
  lblPorcentagem.Text := 'Desconto em %: ' + FormatFloat('0.00', Porcentagem);

  // Valor Final Verde
  lblValorFinal.Text := 'Valor final com desconto: ' + FormatFloat('R$ #,##0.00', FValorFinal);

  // Lógica das Cores (Verde se tiver desconto, Preto se não)
  if VlDesconto > 0 then
  begin
    lblValorFinal.TextSettings.FontColor := TAlphaColors.Green;
    lblValorFinal.TextSettings.Font.Style := [TFontStyle.fsBold]; // Negrito
  end
  else
  begin
    lblValorFinal.TextSettings.FontColor := TAlphaColors.Black;
    lblValorFinal.TextSettings.Font.Style := []; // Normal
  end;
end;

procedure TFrmDesconto.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmDesconto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
