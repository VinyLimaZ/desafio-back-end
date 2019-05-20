require 'sidekiq/web'

Rails.application.routes.draw do
  resource :cnab, only: :new do
    post '/upload', to: 'cnabs#upload'
  end

  mount Sidekiq::Web => '/sidekiq'
end
