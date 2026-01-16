object DM: TDM
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=agenda'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 224
    Top = 128
  end
  object tbContatos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'agenda.contatos'
    Left = 328
    Top = 128
    object tbContatosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tbContatosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object tbContatoscelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      Required = True
      Size = 16
    end
    object tbContatosbloqueado: TBooleanField
      FieldName = 'bloqueado'
      Origin = 'bloqueado'
      Required = True
    end
    object tbContatosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object tbContatosobservacao: TMemoField
      FieldName = 'observacao'
      Origin = 'observacao'
      Required = True
      BlobType = ftMemo
    end
  end
  object dsContatos: TDataSource
    DataSet = tbContatos
    Left = 328
    Top = 208
  end
end
