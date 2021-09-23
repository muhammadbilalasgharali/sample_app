Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'

  get 'static_pages/about'
  get '/about', to: 'static_pages#about'


  get '/help', to: 'static_pages#help'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
