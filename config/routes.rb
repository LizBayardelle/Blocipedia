Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  get 'home/index'
  root 'home#index'
  resources :users, :only => [:show]
  resources :wikis
  get 'private/index'
  resources :charges
  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]
end
