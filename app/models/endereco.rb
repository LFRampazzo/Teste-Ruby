class Endereco

  include Mongoid::Document
  field :cep, type: String
  field :logradouro, type: String
  field :bairro, type: String
  field :cidade, type: String
  field :uf, type: String
  field :endereco_completo, type: String
  
  embedded_in :usuario

  validates :cep, presence: true, length: { is: 9 }
  validates :logradouro, presence: true
  validates :bairro, presence: true
  validates :cidade, presence: true
  validates :uf, presence: true, length: { is: 2 }
  validates :endereco_completo, presence: true

end
