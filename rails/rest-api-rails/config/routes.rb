Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :rest
  #root to: 'rest#index'

  get "rest", to: "rest#index"

  get "rest/users", to: "rest#users"

  get 'rest/investment', to: "investment#index"
  get 'rest/investment/show', to: "investment#show"
  post 'rest/investment/new', to: "investment#new"
  post 'rest/investment/delete', to: "investment#delete"
  post 'rest/investment/update', to: "investment#update"
end
