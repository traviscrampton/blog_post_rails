Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts

  resources :posts do
    resources :tags
  end

  resources :tags
  
end
