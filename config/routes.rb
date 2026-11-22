Rails.application.routes.draw do
  root 'sessions#new'
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  match '/logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/profile', to: 'users#show', as: 'profile'
  get '/settings', to: 'users#settings', as: 'settings'
  post '/settings', to: 'users#update_settings', as: 'update_settings'

  get '/offers', to: 'products#index', as: 'offers'

  get '/cart', to: 'orders#new', as: 'cart'
  post '/cart/add/:product_id', to: 'orders#add_item', as: 'add_to_cart'
  patch  '/cart/increase/:item_id',      to: 'orders#increase_item', as: 'increase_cart_item'
  patch  '/cart/decrease/:item_id',      to: 'orders#decrease_item', as: 'decrease_cart_item'
  post '/orders', to: 'orders#create', as: 'orders'
  get '/confirmation', to: 'orders#show', as: 'order_confirmation'
  
end
