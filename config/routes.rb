Rails.application.routes.draw do
  devise_for :users
  root to: 'parks#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :parks, only: %i[new create show edit update destroy] do
    resources :purchases, only: %i[index create]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
