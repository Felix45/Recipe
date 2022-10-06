Rails.application.routes.draw do
  resources :recipes
  resources :foods
  resources :recipes_foods
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing_page#index"
end
