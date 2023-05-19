Rails.application.routes.draw do
  get 'pictures/create'
  get 'avatars/create'
  get 'users/show'
  get 'events/index'
  devise_for :users

  resources :events

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  namespace :admin do
    root "admin#index"
    resources :users
    resources :events
  end

  post 'events/join/:id' => 'events#join', as: 'event_join'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  root "events#index"
end