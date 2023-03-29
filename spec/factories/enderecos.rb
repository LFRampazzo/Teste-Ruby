FactoryBot.define do
  factory :endereco do
    cep { "01001-000" }
    logradouro { "Praça da Sé" }
    bairro { "Sé" }
    cidade { "São Paulo" }
    uf { "SP" }
    endereco_completo { "Praça da Sé - Sé - São Paulo, SP 01001-000" }

    factory :endereco_com_cep_desformatado do
      cep { "01001000" }
    end

    factory :endereco_com_valor_ausente do
      endereco_completo { "" }
    end
  end
end
