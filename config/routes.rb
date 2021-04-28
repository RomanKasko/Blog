Rails.application.routes.draw do
  devise_for :users
  root to: "home_page#index"
  resources :img_elements

  resources :articles do
    resources :comments
  end
end
