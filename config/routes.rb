Rails.application.routes.draw do
  devise_for :users
  root to: "parks#index"
  resources :parks, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only:[:index, :create]
  end
end
