Rails.application.routes.draw do
  namespace :account do
    resources :registrations
  end
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
