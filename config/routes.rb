Rails.application.routes.draw do
  devise_for :users
  root :to => "disasters#index"
  resources :disasters, only: [:index, :new, :create]

end
