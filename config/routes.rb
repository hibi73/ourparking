Rails.application.routes.draw do
  devise_for :users
  root to: "parks#index"
  resources :parks, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only:[:index, :create]
    resources :comments, only: :create
  end
end
