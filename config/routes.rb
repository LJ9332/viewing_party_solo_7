Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  resources :users, only: [:show, :create] do
    get '/discover', to: 'discover#show'
    get '/movies', to: 'movies#show'
  end
  get '/register', to: 'users#new', as: 'register_user'

end
