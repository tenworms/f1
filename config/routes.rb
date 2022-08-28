Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'

  get '/drivers', to: 'drivers#index'
  get '/drivers/:id', to: 'drivers#show'
end
