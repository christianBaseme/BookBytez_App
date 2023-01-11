Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/create'

  get 'posts/show'

  resources :users do
    member do
      get 'user'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:create, :destroy]

  root to: 'home#index'
  get '/login', to:'sessions#new'

  post '/sessions', to:'sessions#create'

  get '/signout',to: 'sessions#destroy', via: :delete
  #delete '/signout', to: 'sessions#destroy', as: 'signout'

  get 'signup',to:'users#new'

  get 'users/create'

  post 'signup',to:'users#create'

  post '/login',to:'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
