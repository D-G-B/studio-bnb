Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home
 
  resources :studios, only: [ :index, :show, :new, :create ] do
    resources :bookings, only: [ :new, :create]

    collection do
      get :daw, :audio_interface, :micro, :monitor
    end
    
  end
  
  resources :bookings, only: [:destroy]
end
