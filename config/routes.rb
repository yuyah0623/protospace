Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :likes, only: [:create, :destroy]
  resources :tags
  resources :prototypes do
    resources :comments, only: [:new, :create]
  end
  root 'prototypes#index'
end
