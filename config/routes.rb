Rails.application.routes.draw do
  namespace :account do
    resources :registrations, only: %i[show new create]
  end
  namespace :accounts do
    resources :freezes, only: :index
  end
  resources :accounts, only: %i[index show new create] do
    resource :freeze, only: %i[create destroy], module: 'accounts'
  end
end
