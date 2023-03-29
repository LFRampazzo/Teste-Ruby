require 'rails_helper'

RSpec.describe "Usuarios", type: :request do

  let(:usuario) { create :usuario }

  describe "Obter token" do

    context "Validação de parâmetros" do

      it "Parâmetros válidos" do
        post "/api/auth", params: {
          email: usuario.email, senha: usuario.senha
        }, as: :json
        expect(response).to have_http_status(:success)
      end

      it "Parâmetros inválidos" do
        post "/api/auth", params: {
          email: usuario.email, senha: "senha_errada"
        }, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    
    end

  end

end
