Rails.application.routes.draw do

  root 'sessions#new'
  resources :sessions, only: :index
  get "/auth/:provider/callback" => 'sessions#create'

  resources :settings, only: [:edit, :update]
end
