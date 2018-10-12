Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  get 'pages/home', to: 'pages#home'

 resources :games

 get '/signup', to: 'players#new'
 resources :players, except: [:new]
end


