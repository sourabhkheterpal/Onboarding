Rails.application.routes.draw do
  get 'page/index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'generate_codes', to: 'secret_code#generate_codes'
  root to: "secret_code#index"
end
