# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'

  get 'static_pages/about'
  get '/about', to: 'static_pages#about'

  get '/help', to: 'static_pages#help'

  # sign in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
