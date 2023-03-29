class Api::EnderecosController < ApplicationController
  include ValidadorCep
  
  before_action :usuario_autorizado
  before_action :cep_valido?

  # POST /enderecos
  def create
    
    value = endereco_params[:cep]
    response = HTTParty.get("https://viacep.com.br/ws/#{value}/json/")
    
    if response.code == 200
      json = JSON.parse(response.body)

    if json["erro"]
      render json: { errors: "Cep não existe" }, status: :bad_request
    else
      cep = json["cep"]
      logradouro = json["logradouro"]
      bairro = json["bairro"]
      cidade = json["localidade"]
      uf = json["uf"]
      endereco_completo = "#{logradouro} - #{bairro} - #{cidade}, #{uf} #{cep}"

      @endereco = Endereco.new(cep:cep, logradouro:logradouro, bairro:bairro, cidade:cidade, uf:uf, endereco_completo:endereco_completo)

      @usuario.endereco = @endereco
      
      if @usuario.save
        render json: @endereco, status: :created, only: [:cep, :logradouro, :bairro, :cidade, :uf, :endereco_completo]
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
    end
    else
      render json: { errors: "Erro ao consumir serviço externo" }, status: response.code
    end

  end

  private
    
    # Only allow a list of trusted parameters through.
    def endereco_params
      params.permit(:cep)
    end

end
