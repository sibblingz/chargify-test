ChargifyTest::Application.routes.draw do
  post 'chargify/hook' => 'webhooks#create'

  # resources :webhooks


  resources :subscriptions do
    member do
      get 'migrate'
      get 'sync'
      get 'reactivate'
      get 'cancel'
    end
  end


  resources :customers


  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  resources :products


  resources :product_families


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end