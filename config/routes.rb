Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace "api", defaults: { format: 'json' } do
    get "/v1/items", to: "v1/items#index"
  end
end
