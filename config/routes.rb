Rails.application.routes.draw do
  resources :session, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  resources :posts, only: [:new, :create, :index]
  root 'posts#index'
 end
