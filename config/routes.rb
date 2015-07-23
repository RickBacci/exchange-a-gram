Rails.application.routes.draw do

  get "/users/:instagram_id", as: :user, to: "users#show"
  resources :users, only: [:index]
  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  root 'users#index'
end
