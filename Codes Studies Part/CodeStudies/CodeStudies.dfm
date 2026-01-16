object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Consultas dB'
  ClientHeight = 527
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 368
    Top = 45
    Width = 89
    Height = 15
    Caption = 'Digite seu nome:'
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 40
    Width = 289
    Height = 68
    Caption = 'Op'#231'oes de consulta'
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 72
    Top = 72
    Width = 113
    Height = 17
    Caption = 'Nome'
    TabOrder = 1
  end
  object RadioButton2: TRadioButton
    Left = 208
    Top = 72
    Width = 113
    Height = 17
    Caption = 'Bairro'
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 368
    Top = 69
    Width = 353
    Height = 23
    TabOrder = 3
  end
  object Button1: TButton
    Left = 40
    Top = 144
    Width = 681
    Height = 33
    Caption = 'Relizar consulta'
    TabOrder = 4
  end
end
