Rails.application.routes.draw do
  devise_for :users
  root :to => "disasters#index"
  resources :disasters do resources :comments end
  namespace :admin do
    resources :types
  end
  get '*path', to: 'disasters#not_found'


end
