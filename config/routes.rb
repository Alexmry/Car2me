Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings do
    resources :reviews, only: [:create, :new]
  end
  resources :cars, except: :index do
    resources :bookings, only: [ :create ]
  end
end
