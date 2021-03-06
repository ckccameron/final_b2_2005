Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/flights', to: 'flights#index'
  get '/flights/:id', to: 'flights#show'

  get '/passengers/:id', to: 'passengers#show'
  post '/passengers/:passenger_id', to: 'flight_passengers#create'
end
