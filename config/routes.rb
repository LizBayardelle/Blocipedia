Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :users, :only => [:show]
  resources :wikis
  resources :charges
  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]
end
