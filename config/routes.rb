Rails.application.routes.draw do
  root 'auth#index'
  get 'oauthcallback', to: 'auth#oauthcallback', as: 'oauthcallback'
end
