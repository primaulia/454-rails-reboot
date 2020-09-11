Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists, only: [ :index, :show ]
  resources :genres, only: [ :index ]
end
