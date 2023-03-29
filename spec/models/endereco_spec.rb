require 'rails_helper'

RSpec.describe Endereco, type: :model do
  describe "Validações" do

    context "Validar endereço" do

      it "Endereço válido" do
        endereco = Endereco.new attributes_for :endereco
        expect(endereco).to be_valid  
      end

      it "Cep sem formatação" do
        endereco = Endereco.new attributes_for :endereco_com_cep_desformatado
        expect(endereco).to_not be_valid
      end

      it "Endereço válido" do
        endereco = Endereco.new attributes_for :endereco_com_valor_ausente
        expect(endereco).to_not be_valid  
      end

    end

  end
  
end
