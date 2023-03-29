require 'rails_helper'

RSpec.describe "Enderecos", type: :request do

  let(:usuario) { create :usuario }

  describe "Envir cep" do

    context "Com credenciais válidas" do

      it "Dados corretos" do
        data_expiracao = Time.now + 86400
        token = JWT.encode({id: usuario.id, expira_em: data_expiracao}, "secret")
        headers = {
          Authorization: "Bearer #{token}"
        }
        post "/api/enderecos", headers: headers, params: {
          cep: "01001-000"
        }, as: :json
        expect(response).to have_http_status(:success)
      end
      it "Dados incorretos" do
        data_expiracao = Time.now + 86400
        token = JWT.encode({id: usuario.id, expira_em: data_expiracao}, "secret")
        headers = {
          Authorization: "Bearer #{token}"
        }
        post "/api/enderecos", headers: headers, params: {
          cep: "01001--000"
        }, as: :json
        expect(response).to have_http_status(:bad_request)
      end
      it "Dados ausentes" do
        data_expiracao = Time.now + 86400
        token = JWT.encode({id: usuario.id, expira_em: data_expiracao}, "secret")
        headers = {
          Authorization: "Bearer #{token}"
        }
        post "/api/enderecos", headers: headers, params: {
          
        }, as: :json
        expect(response).to have_http_status(:bad_request)
      end
   
    end
    context "Sem credenciais" do

      it "Tentativa de acesso sem token" do
        headers = {

        }
        post "/api/enderecos", headers: headers, params: {
          cep: "01001-000"
        }, as: :json
        expect(response).to have_http_status(:unauthorized)
      end

      it "Tentativa de acesso com token expirado" do
        data_expiracao = Time.now + 1
        token = JWT.encode({id: usuario.id, expira_em: data_expiracao}, "secret")
        headers = {
          Authorization: "Bearer #{token}"
        }
        sleep(1)
        post "/api/enderecos", headers: headers, params: {
          cep: "01001-000"
        }, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    
    end

  end
  

end
