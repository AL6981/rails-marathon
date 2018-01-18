Rails.application.routes.draw do
  resources :houses do
    resources :members
  end
  root 'houses#index'
end
