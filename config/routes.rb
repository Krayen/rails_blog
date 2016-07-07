Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :users
  root to: "home#index"
end
