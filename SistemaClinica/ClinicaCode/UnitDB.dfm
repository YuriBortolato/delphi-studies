object DB: TDB
  Height = 574
  Width = 1019
  object tbPaciente: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'clinica.paciente'
    Left = 280
    Top = 104
    object tbPacienteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tbPacientecpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
      EditMask = '###.###.###-##'
      Size = 14
    end
    object tbPacientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 80
    end
    object tbPacientecelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      Required = True
      EditMask = '(##) #.####-####'
      Size = 16
    end
    object tbPacientedataCadastro: TDateField
      FieldName = 'dataCadastro'
      Origin = 'dataCadastro'
      Required = True
      EditMask = '##/##/####'
    end
  end
  object tbAgenda: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'clinica.agendamento'
    Left = 416
    Top = 104
  end
  object DataSourcePaciente: TDataSource
    DataSet = tbPaciente
    Left = 280
    Top = 208
  end
  object DataSourceAgenda: TDataSource
    DataSet = tbAgenda
    Left = 416
    Top = 208
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=clinica'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 160
  end
end
