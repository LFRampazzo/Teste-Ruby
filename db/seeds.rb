# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
    nome = Faker::Name.unique.name
    email = Faker::Internet.email(name: nome, separators: '_')  
    usuario = Usuario.create(nome:nome, email:email, senha:"12345678")
    usuario.save!
end
