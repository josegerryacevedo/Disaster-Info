Rails.application.routes.draw do
  devise_for :users
  root :to => "disasters#index"
  get '/disasters' => 'disasters#index'
  resources :disasters, only: [:index, :new, :create, :edit, :update, :show, :destroy]

end
