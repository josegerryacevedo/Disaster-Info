Rails.application.routes.draw do
  devise_for :users

  resources :disasters do
    resources :comments
  end

  namespace :admin do
    resources :types
  end

  get '/:short_url' => 'disasters#redirect'
  root :to => "disasters#index"
  get '*path', to: 'disasters#not_found'

end
