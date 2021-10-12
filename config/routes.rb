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
  resources :password_resets, only: %i[new create edit update]
  resources :microposts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]

  resources :groups
  # get path, to: sample_app/public/404.html

  # Any routes that aren't defined above here go to the 404

  # match "*a", :to => "application#routing_error"

  # def routing_error
  #   render "404", :status => 404
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
