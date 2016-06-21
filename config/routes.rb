Rails.application.routes.draw do
  resources :specialities
  resources :employees
  root 'application#index'
  get "/upspec" => 'employees#upspec', as: 'upspec'
end
