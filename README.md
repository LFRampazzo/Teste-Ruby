# Teste - API em Ruby

Para rodar a aplicação é necessário seguir os seguintes passos.

## Versões

- Ruby versão 3.1.3
- MongoDB versão 6.0.4

## Dependências

- Na raiz do projeto rodar o comando 'bundle install' no terminal para instalar as depências necessários do projeto

## Configuração

- Criar arquivo .env na raiz do projeto. Será necessário configurar duas variáveis

ENCRYPT_KEY = "Sua chave de criptografia" <br>
TOKEN_EXPIRATION_TIME = Tempo em segundos de expiração do token. Ex: 86400 caso queira que o yoken expire em um dia

- Por padrão o serviço do mongo roda no host 'localhost:27017', caso utilize outro caminho será necessário alterar o arquivo 'mongoid.yml' 

## Massa de dados

- Para criar a base de dados usada para testes basta rodar o seguinte comando no diretório do projeto 'rails db:seed'. Serão gerados dez registros para testes. Todos os registros vem com a senha '12345678'

## Testes

Para rodar os testes é necessário utilizar o comando 'rspec'. Os seguintes cenários foram testados:

* Autenticação de usuário para obtenção do token
* Autenticação de usuário para obtenção do token com credenciais inválidos
* Informar cep para cadastro de endereço sem o token
* Informar cep para cadastro de endereço com o token expirado
* Informar cep para cadastro de endereço com o token, mas sem informação do cep
* Informar cep para cadastro de endereço com o token, mas com informação do cep inválido
* Informar cep para cadastro de endereço com o token, com informação de cep correto
* Validação dos dados na hora de criação do endereço 

## Projeto

- Para subir projeto utilize o comando 'rails s'. Serviço responde no caminho 'http://localhost:3000/'

## Serviços

Os serviços abaixo podem ser consumidos na aplicação. Caso haja dúvida é possível consultar as rotas através do comando 'rails routes'

* GET /api/usuarios - Lista os usuários. 
* GET /api/usuarios/{id} - Passe o id do usuário na URL para consultar detalhes do usuário. Após salvar endereço será possível consultá-lo nesse caminho. Id pode ser consultado na lista de usuários
* POST /api/auth - Utilize um email de usuário presente na lista e a senha padrão para realizar a autenticação. Será retornado um token para o usuário. Body da requisição precisa conter um JSON com os parâmetros email e senha. Ex: { "email" : "meu email", "senha" : "minha senha" }
* POST /api/enderecos - Adicione o token gerado na requisição acima no header dessa chamada. Em 'Authorization' selecione o tipo 'Bearer Token' para autenticação, lá é onde informaremos o token. O body da requisição precisa conter um JSON com a informação do cep. Ex: { "cep" : "meu cep" }
