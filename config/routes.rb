Rails.application.routes.draw do
  get 'static/homepage'

  root 'static#homepage'
end
