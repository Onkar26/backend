Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"

  post "/forgot-password", to: "users#forgot_password"
  get '/password_resets/:reset_token/edit', to: 'password_resets#edit', as: 'edit_password_reset'
end
