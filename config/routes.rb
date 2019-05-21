require 'sidekiq/web'

Rails.application.routes.draw do
  resource :cnab, only: :new do
    post '/upload', to: 'cnabs#upload'
  end

  resources :stores, only: :index

  mount Sidekiq::Web => '/sidekiq'
end
