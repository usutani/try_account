Rails.application.routes.draw do
  namespace :account do
    resources :registrations, only: %i[show new create]
  end
  resources :accounts, only: %i[show new create]
end
