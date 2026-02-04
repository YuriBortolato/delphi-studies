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

    lblAntigoMesa: TLabel;
    lblAntigoEntrega: TLabel;
    lblAntigoFiscal: TLabel;
    lblAntigoGP: TLabel;
    lblAntigoWpp: TLabel;
    lblAntigoCA: TLabel;
    lblAntigoFin: TLabel;
    lblAntigoDRE: TLabel;
    lblAntigoDash: TLabel;
    lblAntigoIfood: TLabel;
    lblAntigoFome: TLabel;
    lblAntigoDD: TLabel;
    lblAntigoGRep: TLabel;

    lblQtdTerminais: TLabel;
    lblValorT: TLabel;
    btnMenos: TRectangle;
    btnMais: TRectangle;

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
    function GetValorTabela(TagID: Integer): Currency;
    function GetLabelAntigo(TagID: Integer): TLabel;
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
  Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '.', '', [rfReplaceAll]);
  if Texto = '' then Result := 0 else Result := StrToCurrDef(Texto, 0);
end;

function TForm1.GetValorTabela(TagID: Integer): Currency;
begin
  case TagID of
    1, 2, 12: Result := 17.00;
    7..11:    Result := 27.00;
    else      Result := 47.00;
  end;
end;

function TForm1.GetLabelAntigo(TagID: Integer): TLabel;
begin
  Result := nil;
  case TagID of
    1: Result := lblAntigoMesa;
    2: Result := lblAntigoEntrega;
    3: Result := lblAntigoFiscal;
    4: Result := lblAntigoGP;
    5: Result := lblAntigoWpp;
    6: Result := lblAntigoCA;
    7: Result := lblAntigoFin;
    8: Result := lblAntigoDRE;
    9: Result := lblAntigoDash;
    10: Result := lblAntigoIfood;
    11: Result := lblAntigoFome;
    12: Result := lblAntigoDD;
    13: Result := lblAntigoGRep;
  end;
end;

procedure TForm1.InicializarPrecos;
var
  i: Integer;
begin
  for i := 1 to 13 do
    PrecosAtuais[i] := GetValorTabela(i);
end;

procedure TForm1.CalcularTudo;
var
  Total: Currency;
  ValTerminal: Currency;
begin
  Total := 0;

  // Terminal
  if FQtdTerminais <= QTD_MINIMA then
    ValTerminal := VALOR_BASE
  else
    ValTerminal := VALOR_BASE + ((FQtdTerminais - QTD_MINIMA) * VALOR_EXTRA);

  lblQtdTerminais.Text := FQtdTerminais.ToString;
  lblValorT.Text := FormatFloat('R$ #,##0.00', ValTerminal);
  Total := Total + ValTerminal;

  // Soma Checkboxes
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

  lblTotal.Text := FormatFloat('R$ #,##0.00 | mês', Total);
end;

// ============================================================================
// AQUI ESTÁ A MUDANÇA PRINCIPAL PARA O ANDROID
// ============================================================================
procedure TForm1.LabelPrecoClick(Sender: TObject);
var
  LblAtual, LblAntigo: TLabel;
  TagID: Integer;
  ValorTabela, ValorJaComDesconto, DifDesconto: Currency;
begin
  LblAtual := Sender as TLabel;
  TagID := LblAtual.Tag;
  if TagID = 0 then Exit;

  ValorTabela := GetValorTabela(TagID);
  ValorJaComDesconto := PrecosAtuais[TagID];
  LblAntigo := GetLabelAntigo(TagID);

  // Cria o formulário
  FrmDesconto := TFrmDesconto.Create(Application);

  // Configura os valores ANTES de mostrar
  FrmDesconto.ValorOriginal := ValorTabela;
  DifDesconto := ValorTabela - ValorJaComDesconto;
  if DifDesconto > 0.01 then
     FrmDesconto.edtDesconto.Text := FloatToStr(DifDesconto)
  else
     FrmDesconto.edtDesconto.Text := '';

  // CHAMADA ESPECIAL PARA ANDROID (Não trava o app)
  FrmDesconto.ShowModal(procedure(ModalResult: TModalResult)
  begin
    // Esse código roda só quando a janela fechar
    if ModalResult = mrOk then
    begin
      PrecosAtuais[TagID] := FrmDesconto.ValorFinal;
      LblAtual.Text := FormatFloat('R$ #,##0.00', PrecosAtuais[TagID]);

      // Lógica Visual
      if PrecosAtuais[TagID] < ValorTabela then
      begin
        LblAtual.TextSettings.FontColor := TAlphaColors.Green;
        if Assigned(LblAntigo) then LblAntigo.Visible := True;
      end
      else
      begin
        LblAtual.TextSettings.FontColor := TAlphaColors.Black;
        if Assigned(LblAntigo) then LblAntigo.Visible := False;
      end;

      CalcularTudo;
    end;

    // Destrói o formulário da memória
    FrmDesconto.DisposeOf;
  end);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
  Lbl: TLabel;
begin
  FQtdTerminais := 3;
  InicializarPrecos;

  for i := 1 to 13 do
  begin
    Lbl := GetLabelAntigo(i);
    if Assigned(Lbl) then
       Lbl.Visible := False;
  end;

  CalcularTudo;
end;

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

procedure TForm1.CalcularEvent(Sender: TObject);
begin
  CalcularTudo;
end;

end.
