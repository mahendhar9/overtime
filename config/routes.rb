Rails.application.routes.draw do
  resources :posts
  devise_for :users, skip: [:registrations]
  get 'static/homepage'

  root 'static#homepage'
end
