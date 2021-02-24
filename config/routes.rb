Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # root to: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :studios, only: [ :index, :show, :new ] do 
    collection do
      get :daw, :audio_interface, :micro, :monitor
    end
  end
end
