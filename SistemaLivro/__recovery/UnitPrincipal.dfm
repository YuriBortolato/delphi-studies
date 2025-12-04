object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de livros'
  ClientHeight = 552
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 64
    Top = 48
    Width = 250
    Height = 37
    Caption = 'Cadastros de Livros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 64
    Top = 99
    Width = 92
    Height = 17
    Caption = 'Titulo do Livro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 64
    Top = 155
    Width = 35
    Height = 17
    Caption = 'Autor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 64
    Top = 211
    Width = 44
    Height = 17
    Caption = 'Genero'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 432
    Top = 155
    Width = 92
    Height = 17
    Caption = 'Titulo do Livro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 64
    Top = 274
    Width = 4
    Height = 17
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 584
    Top = 319
    Width = 4
    Height = 17
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label7Click
  end
  object Edit1: TEdit
    Left = 64
    Top = 120
    Width = 321
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 64
    Top = 176
    Width = 321
    Height = 23
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 232
    Width = 209
    Height = 23
    TabOrder = 2
    Items.Strings = (
      'Romance'
      'Auto-ajuda'
      'A'#231#227'o'
      'Suspence'
      'Drama')
  end
  object Memo1: TMemo
    Left = 432
    Top = 176
    Width = 329
    Height = 115
    TabOrder = 3
  end
  object RadioButton1: TRadioButton
    Left = 64
    Top = 322
    Width = 113
    Height = 17
    Caption = 'Portugu'#234's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object RadioButton2: TRadioButton
    Left = 64
    Top = 345
    Width = 113
    Height = 17
    Caption = 'Ingl'#234's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object RadioButton3: TRadioButton
    Left = 64
    Top = 384
    Width = 113
    Height = 17
    Caption = 'Espanhol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 432
    Top = 116
    Width = 225
    Height = 29
    Caption = 'Dispon'#237'vel em Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object CheckBox2: TCheckBox
    Left = 600
    Top = 342
    Width = 91
    Height = 18
    Caption = 'Internet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object CheckBox3: TCheckBox
    Left = 600
    Top = 366
    Width = 91
    Height = 18
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object CheckBox4: TCheckBox
    Left = 600
    Top = 390
    Width = 91
    Height = 18
    Caption = 'Loja Fisica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object Button1: TButton
    Left = 49
    Top = 488
    Width = 160
    Height = 41
    Caption = 'Cadastrar'
    TabOrder = 11
  end
  object Button2: TButton
    Left = 233
    Top = 488
    Width = 160
    Height = 41
    Caption = 'Excluir'
    TabOrder = 12
  end
  object Button3: TButton
    Left = 417
    Top = 488
    Width = 160
    Height = 41
    Caption = 'Pesquisar'
    TabOrder = 13
  end
end
