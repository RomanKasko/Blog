Rails.application.routes.draw do
  devise_for :users
  root to: "home_page#index"

  resources :articles do
    resources :comments
  end
end
