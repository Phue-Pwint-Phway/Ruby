Rails.application.routes.draw do
  # get 'post/index'
  # get 'login/login'

  get "users/index"
  
  resources :post
  root to: 'post#index'
  # root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
