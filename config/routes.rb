Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  get '/teams/:id', to: 'teams#show'
  post '/teams', to: 'teams#create'

  get '/drivers', to: 'drivers#index'
  get '/drivers/:id', to: 'drivers#show'

  get '/teams/:team_id/drivers', to: 'team_drivers#index'
  get '/teams/:team_id/drivers/new', to: 'team_drivers#new'
  post '/teams/:team_id/drivers', to: 'team_drivers#create'
end
