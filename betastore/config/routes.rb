Betastore::Application.routes.draw do 
  resources :users
  resources :subscriptions
  namespace :admin do
    resources :products
    resources :users
    resources :customers
  end
  get '/products' => 'products#index'
  root :to => 'subscriptions#new'
end