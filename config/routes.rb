Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  api_guard_routes for: 'users'

  namespace :api do
    resources :jogging_times
    resources :users
  end
end