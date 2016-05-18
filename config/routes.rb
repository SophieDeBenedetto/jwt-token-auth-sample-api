Rails.application.routes.draw do
  resources :users
  post '/login', to: "sessions#create"
  mount Knock::Engine => "/knock"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
