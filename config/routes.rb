Rails.application.routes.draw do
  root 'signatures#index'
  post '/unsign' => 'signatures#unsign'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign' => 'sessions#new', :as => :sign
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
