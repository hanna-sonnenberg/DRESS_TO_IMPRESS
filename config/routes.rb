Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :outfits do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
