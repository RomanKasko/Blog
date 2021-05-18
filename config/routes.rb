Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :img_elements
  get 'find', to: 'articles#find'
  resources :articles do
    resources :comments
  end
  resources :tags, only: [:show]
end

