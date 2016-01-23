Rails.application.routes.draw do
  resources :trails, only: [:index]

  root 'trails#index'
end
