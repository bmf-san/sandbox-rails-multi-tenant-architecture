Rails.application.routes.draw do
  if defined? Debugbar
    mount Debugbar::Engine => Debugbar.config.prefix
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  get "my" => "my#index"

  delete "my/delete_account" => "my#delete_account"

  resources :posts do
    resources :comments, only: :create
    resource :like, only: [:create, :destroy]
  end

  resources :likes, only: :create
end
