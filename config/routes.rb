Rails.application.routes.draw do
  resources :specialities
  resources :employees
  root 'application#index'
end
