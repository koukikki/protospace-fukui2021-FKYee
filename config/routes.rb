Rails.application.routes.draw do
  devise_for :prototypes
  devise_for :comments
  devise_for :users
end
