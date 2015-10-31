Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :prototypes do
    resources :comments, only: [:new, :create]
  end
  root 'prototypes#index'
end
