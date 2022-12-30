Rails.application.routes.draw do
  resources :users do
    member do
      get 'user'
    end
  end

  root to: 'home#index'
  get '/login', to:'sessions#new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'signup',to:'users#new'

  get 'users/create'

  post 'signup',to:'users#create'

  post '/login',to:'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
