Rails.application.routes.draw do
  root to: redirect('/users')
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :endorsements, only: [:new, :create]
  end

  namespace :admin do
    resources :users, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
