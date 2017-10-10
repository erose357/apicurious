Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index]
end
