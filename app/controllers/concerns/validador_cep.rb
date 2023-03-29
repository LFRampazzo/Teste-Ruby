module ValidadorCep
    
    private 

    def cep_valido?
        
        value = params[:cep]

        if value.present?

            if value.instance_of? String
                
                unless !!(value =~ /^\d{5}-?\d{3}$/)
            
                    render json: { errors: "Cep não é válido" }, status: :bad_request
            
                end
            
            else
            
                render json: { errors: "O parametro cep deve ser uma string" }, status: :bad_request
            
            end

        else
            render json: { errors: "Obrigatório informar Cep" }, status: :bad_request
        end
        
    end

end