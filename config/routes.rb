Rails.application.routes.draw do
  root to: redirect('/users')
  resources :users, only: [:index, :show, :create]
  resources :endorsements, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
