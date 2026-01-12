object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 56
    Top = 40
    Width = 92
    Height = 15
    Caption = 'Digite seu nome: '
  end
  object lblResultado: TLabel
    Left = 56
    Top = 152
    Width = 105
    Height = 15
    Caption = '_____________________'
  end
  object Button1: TButton
    Left = 168
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object txtNome: TEdit
    Left = 56
    Top = 61
    Width = 187
    Height = 23
    TabOrder = 1
  end
end
