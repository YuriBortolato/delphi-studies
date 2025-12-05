object Form1: TForm1
  Left = 0
  Top = 0
  Align = alTop
  Caption = 'Form1'
  ClientHeight = 629
  ClientWidth = 1029
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1029
    Height = 121
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 721
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 319
      Height = 45
      Caption = 'Cadastros de Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 447
      Top = 39
      Width = 97
      Height = 45
      Caption = 'Novo'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 568
      Top = 39
      Width = 97
      Height = 45
      Caption = 'Salvar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 696
      Top = 39
      Width = 97
      Height = 45
      Caption = 'Cancelar'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 824
      Top = 39
      Width = 97
      Height = 45
      Caption = 'Excluir'
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 121
    Width = 1029
    Height = 508
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1282
    ExplicitHeight = 738
    object TabSheet1: TTabSheet
      Caption = 'Dados Pessoais'
      object Label2: TLabel
        Left = 24
        Top = 40
        Width = 96
        Height = 15
        Caption = 'Codigo do Cliente'
      end
      object Label3: TLabel
        Left = 24
        Top = 40
        Width = 96
        Height = 15
        Caption = 'Codigo do Cliente'
      end
      object Label4: TLabel
        Left = 24
        Top = 120
        Width = 90
        Height = 15
        Caption = 'Nome do Cliente'
      end
      object Label5: TLabel
        Left = 240
        Top = 40
        Width = 81
        Height = 15
        Caption = 'Tipo do Cliente'
      end
      object Label7: TLabel
        Left = 500
        Top = 40
        Width = 15
        Height = 15
        Caption = 'RG'
      end
      object Label8: TLabel
        Left = 24
        Top = 192
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
      end
      object Label10: TLabel
        Left = 740
        Top = 40
        Width = 96
        Height = 15
        Caption = 'Data de Expedi'#231#227'o'
      end
      object Label11: TLabel
        Left = 24
        Top = 280
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object Label12: TLabel
        Left = 240
        Top = 280
        Width = 37
        Height = 15
        Caption = 'Cidade'
      end
      object Label13: TLabel
        Left = 24
        Top = 368
        Width = 14
        Height = 15
        Caption = 'UF'
      end
      object Label14: TLabel
        Left = 168
        Top = 368
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label15: TLabel
        Left = 500
        Top = 192
        Width = 34
        Height = 15
        Caption = 'E-mail'
      end
      object Label18: TLabel
        Left = 500
        Top = 120
        Width = 45
        Height = 15
        Caption = 'Telefone'
      end
      object Label19: TLabel
        Left = 740
        Top = 120
        Width = 37
        Height = 15
        Caption = 'Celular'
      end
      object Edit1: TEdit
        Left = 24
        Top = 61
        Width = 177
        Height = 23
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 23
        Top = 141
        Width = 398
        Height = 23
        TabOrder = 1
      end
      object ComboBox1: TComboBox
        Left = 240
        Top = 61
        Width = 181
        Height = 23
        Style = csDropDownList
        TabOrder = 2
        Items.Strings = (
          'Pessoa Fisica'
          'Pessoa Juritica')
      end
      object Edit4: TEdit
        Left = 500
        Top = 61
        Width = 190
        Height = 23
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 24
        Top = 213
        Width = 398
        Height = 23
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 740
        Top = 61
        Width = 212
        Height = 23
        TabOrder = 5
      end
      object Edit6: TEdit
        Left = 24
        Top = 301
        Width = 177
        Height = 23
        TabOrder = 6
      end
      object Edit8: TEdit
        Left = 24
        Top = 389
        Width = 108
        Height = 23
        TabOrder = 7
      end
      object Edit9: TEdit
        Left = 168
        Top = 389
        Width = 137
        Height = 23
        TabOrder = 8
      end
      object Edit10: TEdit
        Left = 500
        Top = 213
        Width = 477
        Height = 23
        TabOrder = 9
      end
      object Edit7: TEdit
        Left = 240
        Top = 301
        Width = 181
        Height = 23
        TabOrder = 10
      end
      object Edit12: TEdit
        Left = 500
        Top = 141
        Width = 190
        Height = 23
        TabOrder = 11
      end
      object Edit11: TEdit
        Left = 740
        Top = 141
        Width = 212
        Height = 23
        TabOrder = 12
      end
      object CheckBox1: TCheckBox
        Left = 536
        Top = 303
        Width = 113
        Height = 20
        Caption = 'Cliente Inativo'
        TabOrder = 13
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados do C'#244'njuge'
      ImageIndex = 1
      object Label6: TLabel
        Left = 32
        Top = 48
        Width = 96
        Height = 15
        Caption = 'Nome do conjuge'
      end
      object Label9: TLabel
        Left = 32
        Top = 112
        Width = 102
        Height = 15
        Caption = 'Data de Nacimento'
      end
      object Label16: TLabel
        Left = 464
        Top = 48
        Width = 21
        Height = 15
        Caption = 'CPF'
      end
      object Edit13: TEdit
        Left = 32
        Top = 69
        Width = 345
        Height = 23
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 464
        Top = 141
        Width = 505
        Height = 265
        Caption = 'Contatos do C'#244'njuge'
        TabOrder = 1
        object Label17: TLabel
          Left = 21
          Top = 64
          Width = 37
          Height = 15
          Caption = 'Celular'
        end
        object Label20: TLabel
          Left = 21
          Top = 189
          Width = 34
          Height = 15
          Caption = 'E-mail'
        end
        object Label21: TLabel
          Left = 261
          Top = 61
          Width = 56
          Height = 15
          Caption = 'Operadora'
        end
        object Edit17: TEdit
          Left = 21
          Top = 210
          Width = 422
          Height = 23
          TabOrder = 0
        end
        object Edit16: TEdit
          Left = 21
          Top = 85
          Width = 177
          Height = 23
          TabOrder = 1
        end
        object ComboBox2: TComboBox
          Left = 261
          Top = 85
          Width = 144
          Height = 23
          Style = csDropDownList
          TabOrder = 2
          Items.Strings = (
            'Tim '
            'Claro'
            'Vivo'
            'Oi')
        end
      end
      object Edit14: TEdit
        Left = 464
        Top = 69
        Width = 177
        Height = 23
        TabOrder = 2
      end
      object Edit15: TEdit
        Left = 32
        Top = 133
        Width = 201
        Height = 23
        TabOrder = 3
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Dados do Trabalho'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'An'#225'nise de Cr'#233'dito'
      ImageIndex = 3
    end
  end
end
