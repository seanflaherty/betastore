Betastore::Application.routes.draw do 
  devise_for :users
  resources :users
  resources :products
  resources :subscriptions
  
  post '/products/:product_id/add_to_cart' => 'carts#update', as: 'add_to_cart'
  get '/cart' => 'carts#show', as: 'cart'

  put '/orders' => 'orders#update', as: 'order'

  get '/completed' => 'orders#show', as: 'completed'
  #SCF Do I need this?
  #put '/completed' => 'orders#show', as: 'completed'

  get '/checkout'   => 'orders#new', as: 'neworder'
  post '/checkout'  => 'orders#create'

  namespace :admin do
    resources :products
    #SCFbinding.pry
    resources :users
    resources :customers
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end
  root :to => 'products#index'

end