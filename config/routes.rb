Rails.application.routes.draw do
  get 'recipes/public_recipes'
  resources :recipes do
    resources :recipes_foods
  end
  resources :foods
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing_page#index"
end
