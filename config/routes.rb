Rails.application.routes.draw do
  devise_for :users
  root :to => "disasters#index"
  resources :disasters, only:
      [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :comments, only:
      [:index, :new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :types
  end

end
