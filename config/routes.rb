Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments, only: [ :create ]
  end

  resources :users, only: [ :new, :create, :edit, :update ]
  resources :sessions, only: [ :new, :create, :destroy ]
end
