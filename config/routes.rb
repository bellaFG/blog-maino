Rails.application.routes.draw do
  # Configuração do Devise
  devise_for :users, controllers: { sessions: "users/sessions" }

  # Rota principal (root)
  root "articles#index"

  # Rotas para Articles e Comments
  resources :articles, param: :slug do
    collection do
      get :search, to: "articles#search" # Rota para busca de artigos
    end

    resources :comments, only: [ :create ] # Rotas para comentários associados a artigos
  end
end
