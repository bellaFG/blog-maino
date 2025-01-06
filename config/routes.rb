Rails.application.routes.draw do
  devise_for :users


  root "articles#index"

  resources :articles, param: :slug do
    collection do
      get :search, to: "articles#search"
    end

    resources :comments, only: [ :create ]
  end
end
