Rails.application.routes.draw do
  root 'post#list'
  resources :post

  get "users/index"

  # # get "/post", to: "post#list"
  get "/post/:id", to: "post#show"
  get "post/create"
  
  
  # root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
