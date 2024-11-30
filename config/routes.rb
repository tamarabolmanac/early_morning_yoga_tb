Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :index, :show]
end
