Rails.application.routes.draw do
  resources :users
  get "login", to: "users#login_form"
  post "login", to: "users#login"
  get "home", to: 'home#index'
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
