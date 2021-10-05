Rails.application.routes.draw do
  resources :posts
  get 'login/login'
  # get 'posts/index'
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  post 'posts/confirm', to: 'posts#confirm', as: 'confirm'
end
