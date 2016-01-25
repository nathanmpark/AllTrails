Rails.application.routes.draw do
  resources :trails, only: [:create]
  resources :calories, only: [:index]

  root to: redirect('/calories')
end
