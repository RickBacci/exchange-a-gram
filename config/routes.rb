Rails.application.routes.draw do

  resources :users, only: [:index, :show]
  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'users#index'
end
