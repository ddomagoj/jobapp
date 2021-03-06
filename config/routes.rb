Rails.application.routes.draw do
  get 'pages/home'
  resources :applications
  root to: 'pages#home'
  devise_for :users, path: "", path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :jobs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
