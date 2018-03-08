Rails.application.routes.draw do
  root 'signatures#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/unsign' => 'signatures#unsign', :as => :unsign
end
