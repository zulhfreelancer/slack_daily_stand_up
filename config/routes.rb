Rails.application.routes.draw do
  resources :reports, except: [:destroy]
  devise_for :users
  root "reports#new"
end
