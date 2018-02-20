Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: :index
  end

  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resource :session do
    delete :destroy, on: :member
  end

  root to: 'home#index'
end
