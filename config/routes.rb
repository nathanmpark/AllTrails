Rails.application.routes.draw do
  resources :trails, only: [:index, :create]

  root 'trails#index'
end
