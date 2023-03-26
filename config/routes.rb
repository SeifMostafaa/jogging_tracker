Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :jogging_times
    resources :users
    get 'weekly_report', :to => 'jogging_times#weekly_report'
  end
  api_guard_routes for: 'users'
end