Betastore::Application.routes.draw do 
  resources :users
  resources :products
  resources :subscriptions
  
  post '/products/:product_id/add_to_cart' => 'carts#update', as: 'add_to_cart'
  get '/cart' => 'carts#show', as: 'cart'

  put '/orders' => 'orders#update', as: 'order'

  get '/checkout'   => 'orders#new', as: 'neworder'
  post '/checkout'  => 'orders#create'

  namespace :admin do
    resources :products
    resources :users
    resources :customers
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end
  root :to => 'products#index'

end