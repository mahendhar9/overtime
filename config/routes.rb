Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'static/homepage'

  root 'static#homepage'
end
