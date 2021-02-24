Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :studios, only: [ :index, :show, :new ] do
    resources :bookings, only: [ :new, :create]

  end
  resources :bookings, only: [:destroy]
end
