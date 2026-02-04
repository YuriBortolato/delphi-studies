unit uDesconto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Layouts;

type
  TFrmDesconto = class(TForm)
    rectFundo: TRectangle;
    edtValorAtual: TEdit;
    edtDesconto: TEdit;

    lblResumo: TLabel;
    lblValorDesconto: TLabel;
    lblPorcentagem: TLabel;
    lblValorFinal: TLabel;

    btnConfirmar: TRectangle;
    btnCancelar: TRectangle;

    btnFecharX: TSpeedButton;

    procedure FormShow(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharXClick(Sender: TObject);
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
  Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '.', '', [rfReplaceAll]);
  if (Trim(Texto) = '') or (Trim(Texto) = ',') then Result := 0
  else Result := StrToCurrDef(Trim(Texto), 0);
end;

procedure TFrmDesconto.FormShow(Sender: TObject);
begin
  edtValorAtual.Text := FormatFloat('#,##0.00', FValorOriginal);
  lblResumo.Text := 'Valor sem desconto: ' + FormatFloat('R$ #,##0.00', FValorOriginal);

  // Força o cálculo inicial para atualizar cores e textos
  edtDescontoChange(Self);
  edtDesconto.SetFocus;
end;

procedure TFrmDesconto.edtDescontoChange(Sender: TObject);
var
  VlDesconto: Currency;
  Porcentagem: Double;
begin
  VlDesconto := StrToCurrSafe(edtDesconto.Text);

  FValorFinal := FValorOriginal - VlDesconto;
  if FValorFinal < 0 then FValorFinal := 0;

  if FValorOriginal > 0 then
    Porcentagem := (VlDesconto / FValorOriginal) * 100
  else
    Porcentagem := 0;

  lblValorDesconto.Text := 'Desconto: -' + FormatFloat('R$ #,##0.00', VlDesconto);

  lblValorDesconto.TextSettings.FontColor := TAlphaColors.Red;

  lblPorcentagem.Text := 'Desconto em %: ' + FormatFloat('0.00', Porcentagem);
  lblValorFinal.Text := 'Valor final com desconto: ' + FormatFloat('R$ #,##0.00', FValorFinal);

  if VlDesconto > 0 then
  begin
    lblValorFinal.TextSettings.FontColor := TAlphaColors.Green;
    lblValorFinal.TextSettings.Font.Style := [TFontStyle.fsBold];
  end
  else
  begin
    lblValorFinal.TextSettings.FontColor := TAlphaColors.Black;
    lblValorFinal.TextSettings.Font.Style := [];
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

procedure TFrmDesconto.btnFecharXClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
