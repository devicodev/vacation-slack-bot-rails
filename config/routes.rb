Rails.application.routes.draw do

  root 'settings#edit'
  resources :sessions, only: :new
  get "/auth/:provider/callback" => 'sessions#create'

  resources :settings, only: [:edit, :update]
end
