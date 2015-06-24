Rails.application.routes.draw do
  root to: 'alexa_top_sites#index'

  resources :alexa_top_sites, only: [:index]
end
