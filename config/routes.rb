Rails.application.routes.draw do
  devise_for :users
  root :to => "disasters#index"

end
