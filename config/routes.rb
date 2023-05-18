Rails.application.routes.draw do
  get 'avatars/create'
  get 'users/show'
  get 'events/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  post 'events/join/:id' => 'events#join', as: 'event_join'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  # Defines the root path route ("/")
  root "events#index"
end