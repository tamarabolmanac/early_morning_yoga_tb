Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :session, only: [:new, :create]

  resources :users, only: [:new, :create, :index, :show]

  get 'users/confirm/:token', to: 'users#confirm', as: 'confirm_user'

  post "login", to: "session#create"
  delete "logout", to: "session#destroy", as: 'logout'
  get "login", to: "session#new"

  get "/about-yoga", to: "welcome#about_yoga"
end
