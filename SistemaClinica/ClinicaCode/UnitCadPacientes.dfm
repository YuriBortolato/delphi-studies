object FormCadPacientes: TFormCadPacientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pacientes'
  ClientHeight = 572
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label2: TLabel
    Left = 40
    Top = 147
    Width = 15
    Height = 21
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 240
    Top = 147
    Width = 27
    Height = 21
    Caption = 'CPF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 235
    Width = 115
    Height = 21
    Caption = 'Nome Completo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 325
    Width = 49
    Height = 21
    Caption = 'Celular'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 240
    Top = 331
    Width = 119
    Height = 21
    Caption = 'Data de Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 576
    Top = 119
    Width = 83
    Height = 15
    Caption = 'Buscar Paciente'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1013
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 40
      Top = 27
      Width = 239
      Height = 32
      Caption = 'Cadastro de Paciente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBNavigator1: TDBNavigator
      Left = 504
      Top = 3
      Width = 430
      Height = 92
      DataSource = DB.DataSourcePaciente
      TabOrder = 0
    end
  end
  object DBEdit1: TDBEdit
    Left = 40
    Top = 168
    Width = 161
    Height = 23
    DataField = 'id'
    DataSource = DB.DataSourcePaciente
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 40
    Top = 256
    Width = 473
    Height = 23
    DataField = 'nome'
    DataSource = DB.DataSourcePaciente
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 40
    Top = 352
    Width = 169
    Height = 23
    DataField = 'celular'
    DataSource = DB.DataSourcePaciente
    MaxLength = 16
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 240
    Top = 352
    Width = 209
    Height = 23
    DataField = 'dataCadastro'
    DataSource = DB.DataSourcePaciente
    MaxLength = 10
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 240
    Top = 168
    Width = 233
    Height = 23
    DataField = 'cpf'
    DataSource = DB.DataSourcePaciente
    MaxLength = 14
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 576
    Top = 184
    Width = 351
    Height = 369
    DataSource = DB.DataSourcePaciente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'PACIENTES CADASTRADOS'
        Visible = True
      end>
  end
  object txtBusca: TEdit
    Left = 576
    Top = 140
    Width = 377
    Height = 23
    TabOrder = 7
    OnChange = txtBuscaChange
  end
end
