class ApplicationController < ActionController::API
    
    Dotenv.load

    def encode_token(payload)
        JWT.encode(payload, ENV["ENCRYPT_KEY"])
    end

    def decode_token
        
        headers = request.headers["Authorization"]
        if headers
            token = headers.split(" ").last
            begin            
                JWT.decode(token, ENV["ENCRYPT_KEY"], true, algorithm: "HS256")
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def usuario_autorizado

        token = decode_token
        if token 
            if (token[0]["expira_em"] <=> Time.now) == -1
                render json: { msg: "Token expirado. Favor validar novamente" }, status: :unauthorized
            else
                id = token[0]["id"]
                @usuario = Usuario.find(id)
            end
        else
            render json: { msg: "Usuário precisa estar autenticado" }, status: :unauthorized
        end

    end
    
end
