Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  get 'pages/home', to: 'pages#home'

 resources :games
end


 get '/games', to: 'games#index'
  get '/games/new', to: 'games#new', as: 'new_game'
  get '/games/:id', to: 'games#show', as: 'game'
  post '/games', to: 'games#create'