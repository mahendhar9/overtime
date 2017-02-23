Rails.application.routes.draw do
  devise_for :users
  get 'static/homepage'

  root 'static#homepage'
end
