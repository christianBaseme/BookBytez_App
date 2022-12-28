Rails.application.routes.draw do


  root to: 'home#index'
  get '/login', to:'sessions#new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'signup',to:'users#new'

  get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
