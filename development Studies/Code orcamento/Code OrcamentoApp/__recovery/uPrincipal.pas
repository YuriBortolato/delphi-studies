unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  uDesconto, FMX.TabControl;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    Rectangle1: TRectangle;
    lblTotal: TLabel;
    TabGastronômico: TTabItem;
    TabGerencial: TTabItem;
    VertScrollBox1: TVertScrollBox;
    Layout3: TLayout;
    LayoutFiscal: TLayout;
    chkFiscalGerencial: TCheckBox;
    Layout7: TLayout;
    LayoutFinanceiro: TLayout;
    chkFinanceiroGerencial: TCheckBox;
    Layout8: TLayout;
    LayoutDre: TLayout;
    chkDreGerencial: TCheckBox;
    Layout9: TLayout;
    LayoutDashboard: TLayout;
    chkDashboardGerencial: TCheckBox;
    Layout13: TLayout;
    LayoutGerenceRep: TLayout;
    chkGerenceRep: TCheckBox;
    VertScrollBox2: TVertScrollBox;
    Layout15: TLayout;
    Layout16: TLayout;
    chkMesa: TCheckBox;
    Layout17: TLayout;
    Layout18: TLayout;
    chkEntrega: TCheckBox;
    Layout19: TLayout;
    Layout20: TLayout;
    chkFiscal: TCheckBox;
    Layout21: TLayout;
    Layout22: TLayout;
    chkGerencePlus: TCheckBox;
    Layout23: TLayout;
    Layout24: TLayout;
    chkWhatsapp: TCheckBox;
    Layout25: TLayout;
    Layout26: TLayout;
    chkComeraqui: TCheckBox;
    Layout27: TLayout;
    Layout28: TLayout;
    chkFinanceiro: TCheckBox;
    Layout29: TLayout;
    Layout30: TLayout;
    chkDre: TCheckBox;
    Layout31: TLayout;
    Layout32: TLayout;
    chkDashboard: TCheckBox;
    Layout33: TLayout;
    Layout34: TLayout;
    chkIfood: TCheckBox;
    Layout35: TLayout;
    Layout36: TLayout;
    chkAiqfome: TCheckBox;
    Layout37: TLayout;
    Layout38: TLayout;
    chkDeliveryDireto: TCheckBox;
    Layout41: TLayout;
    Layout42: TLayout;
    btnMenos: TRectangle;
    Label5: TLabel;
    Rectangle3: TRectangle;
    btnMais: TLabel;
    lblQtdTerminais: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Label7: TLabel;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    btnMenosGerencial: TRectangle;
    Label1: TLabel;
    btnMaisGerencial: TRectangle;
    Label2: TLabel;
    lblQtdTerminaisGerencial: TLabel;
    Layout10: TLayout;
    Label4: TLabel;

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

procedure TForm1.LabelPrecoClick(Sender: TObject);
var
  LblAtual, LblAntigo: TLabel;
  TagID: Integer;
  ValorTabela, ValorJaComDesconto, DifDesconto: Currency;
  LForm: TFrmDesconto;
begin
  LblAtual := Sender as TLabel;
  TagID := LblAtual.Tag;
  if TagID = 0 then Exit;

  ValorTabela := GetValorTabela(TagID);
  ValorJaComDesconto := PrecosAtuais[TagID];
  LblAntigo := GetLabelAntigo(TagID);

  LForm := TFrmDesconto.Create(nil);

  LForm.ValorOriginal := ValorTabela;

  DifDesconto := ValorTabela - ValorJaComDesconto;
  if DifDesconto > 0.01 then
     LForm.edtDesconto.Text := FloatToStr(DifDesconto)
  else
     LForm.edtDesconto.Text := '';

  LForm.ShowModal(procedure(ModalResult: TModalResult)
  begin
    if ModalResult = mrOk then
    begin
      PrecosAtuais[TagID] := LForm.ValorFinal;

      LblAtual.Text := FormatFloat('R$ #,##0.00', PrecosAtuais[TagID]);

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

    TThread.ForceQueue(nil, procedure
    begin
      LForm.DisposeOf;
    end);
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
