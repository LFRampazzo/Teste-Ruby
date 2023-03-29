class Api::UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show ]

  # GET /usuarios
  def index
    @usuarios = Usuario.all

    render json: @usuarios, only: [:_id, :nome, :email]
  end

  # GET /usuarios/1
  def show
    render json: @usuario, only: [:_id, :nome, :email, :endereco, :cep, :logradouro, :bairro, :cidade, :uf, :endereco_completo]
  end

  # POST /auth
  def login

    @usuario = Usuario.find_by(email: usuario_params[:email])

    if @usuario && @usuario.authenticate_senha(usuario_params[:senha])
      
      data_expiracao = Time.now + ENV["TOKEN_EXPIRATION_TIME"].to_i
      token = encode_token({id: @usuario.id, expira_em: data_expiracao})
      render json: {token: token}, status: :ok
      
    else

      render json: { msg: "Usuário ou senha inválidos"}, status: :unauthorized

    end
    
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.permit(:email, :senha)
    end
    
end
