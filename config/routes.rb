Rails.application.routes.draw do
  root 'sessions#new'
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/profile', to: 'users#show', as: 'profile'
  get '/settings', to: 'users#settings', as: 'settings'
  post '/settings', to: 'users#update_settings', as: 'update_settings'

  get '/offers', to: 'products#index', as: 'offers'

  get '/cart', to: 'orders#new', as: 'cart'
  post '/orders', to: 'orders#create', as: 'orders'
  get '/confirmation', to: 'orders#show', as: 'order_confirmation'
  
end
