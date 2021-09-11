Rails.application.routes.draw do
  root to: 'prototypes#index'

  devise_for :prototypes
  devise_for :comments
  devise_for :users
end
