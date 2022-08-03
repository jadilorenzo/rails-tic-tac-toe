Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/", to: "home#index"
  get "/users/login", to: "users#login"
  post "users/login_success", to: "users#login_success"
  resources :users
end
