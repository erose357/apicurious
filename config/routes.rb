Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :dashboard, only: [:index]

  get '/logout', to: 'sessions#destroy'
end
