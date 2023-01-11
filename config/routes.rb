Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles do
    resources :comments
  end
  
  # Defines the root path route ("/")
  
end
