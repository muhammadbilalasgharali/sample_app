# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get 'password_resets/new'
  get 'password_resets/edit'
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

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :users
  resources :password_resets, only:[:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
