Rails.application.routes.draw do
  get '/users/current-user', to: "current_user#show"
  resources :users
  # post '/login', to: "sessions#create"
  mount Knock::Engine => "/knock"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
