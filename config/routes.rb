Rails.application.routes.draw do
  resources :specialities
  resources :employees
  root 'application#index'
  #get "/upspec" => 'employees#upspec', as: 'upspec'
  #match '/upspec', to: 'employees#upspec', via: [:post]
  match "/upspec" => "employees#upspec", :via => :post, :as => :create_speciality
end
