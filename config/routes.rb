Rails.application.routes.draw do
  resources :specialities
  resources :employees
  root 'application#index'
  match '/upspec', to: 'employees#upspec', via: [:post, :get]
end
