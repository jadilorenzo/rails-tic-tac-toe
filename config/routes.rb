Rails.application.routes.draw do
  post "/game/update", to: "game#update"
  get "/game", to: "game#index"
  post "/game/clear", to: "game#clear" ### TEMPORARY
  get "/", to: "home#index"
  get "/users/login", to: "users#login"
  post "/users/login_success", to: "users#login_success"
  post "/users/logout", to: "users#logout"
  resources :users
end
