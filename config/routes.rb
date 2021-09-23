Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root to: 'prototypes#index'

  resources :users, only: :show
  resources :prototypes, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
  end


end
