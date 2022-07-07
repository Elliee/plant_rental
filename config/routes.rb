Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :plants do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[show edit update destroy]
  get '/outbound_bookings', to: 'bookings#outbound_bookings'
  get '/inbound_bookings', to: 'bookings#inbound_bookings'
  get '/owned_plants', to: 'plants#owned_plants'
  post '/inbound_bookings/accept_booking', to: 'bookings#accept_booking'
  post '/inbound_bookings/decline_booking', to: 'bookings#decline_booking'
end
