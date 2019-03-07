Rails.application.routes.draw do
  get 'response/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "requests#new"
  resources :requests
  devise_for :admins, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :admins do
    get 'sign_in', to: 'devise/sessions#new'
  end
  get 'admin/dashboard', :to => 'admin#dashboard'
end