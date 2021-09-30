Rails.application.routes.draw do
  # resources :rename_password_topassword_digests
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'post/index'
  get 'post/upload'
  
  root 'users#index'

  resources :users
  resources :posts do
    collection { post :import }
  end

  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: :index
  
  # get "/posts/:id", to: "posts#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
