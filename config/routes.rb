Rails.application.routes.draw do
  devise_for :users
  devise_for :prototypes
  devise_for :comments

  root to: 'prototypes#index'

end
