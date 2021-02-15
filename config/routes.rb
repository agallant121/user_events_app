Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_events, only: [:index, :show, :create]
      get '/stats', to: 'stats#index'
    end
  end
end
