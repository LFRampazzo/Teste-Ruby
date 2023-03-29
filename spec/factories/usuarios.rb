FactoryBot.define do
  factory :usuario do
    nome { Faker::Name.unique.name }
    email { Faker::Internet.email(name: senha, separators: '_') }
    senha { "12345678" }
  end
end
