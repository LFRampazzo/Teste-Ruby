class Usuario

  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :nome, type: String
  field :email, type: String
  field :senha_digest, type: String
  
  embeds_one :endereco
  
  has_secure_password :senha

end
