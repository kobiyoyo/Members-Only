# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  resources :sessions, only: %i[new create destroy]
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :posts, only: %i[new create index]
  root 'posts#index'
  resources :users, only: [:new]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
end
