class Usuario

  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :nome, type: String
  field :email, type: String
  field :senha_digest, type: String
  
  validates :nome, presence: true
  validates :email, uniqueness: true, presence: true
  validates :senha_digest, presence: true, length: { minimum: 8 }
  
  embeds_one :endereco
  
  has_secure_password :senha

end
