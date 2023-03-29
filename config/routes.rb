Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :enderecos, only: [ :create ]
    resources :usuarios, only: [ :index, :show ]
    post "/auth", to: "usuarios#login"
  end
end
