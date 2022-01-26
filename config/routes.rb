Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'session#create'
  root to: 'home#index'
end
