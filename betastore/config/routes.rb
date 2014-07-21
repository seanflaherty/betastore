Betastore::Application.routes.draw do 
  resources :users

  resources :subscriptions
  root :to => 'subscriptions#new'
end