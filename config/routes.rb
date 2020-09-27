Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations"}
  get "/index", to:"articles#index"
  get '/show',  to:"articles#show"
  get '/new',   to:"articles#new"
  get '/edit',  to:"articles#edit"
  get "/inform", to:"articles#inform"
  root "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
end
