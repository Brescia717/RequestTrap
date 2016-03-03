Rails.application.routes.draw do

  root 'welcome#index'
  resources :watch_requests, only: [:show]
  match ':trap_id', to: 'requests#create', via: [:get, :post, :put, :delete]
  get ':trap_id/requests', to: 'requests#index'
  get ':trap_id/requests/:id', to: 'requests#show'
end
