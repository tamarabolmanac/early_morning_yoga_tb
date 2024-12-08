Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :session, only: [:new, :create]

  resources :password_reset, only: [:new, :create]

  resources :users, only: [:new, :create, :index, :show]

  get 'users/confirm/:token', to: 'users#confirm', as: 'confirm_user'

  post "login", to: "session#create"
  delete "logout", to: "session#destroy", as: 'logout'
  get "login", to: "session#new"

  get "/about-yoga", to: "welcome#about_yoga"

  get "/change_password", to: "password_reset#change_password"
  post "/request_reset", to: "password_reset#request_reset"
  get "/reset_password/:token", to: "password_reset#reset_password", as: 'reset_password'
end
