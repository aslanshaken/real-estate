Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :buildings, only: [:index, :create, :update]
    end
  end
end
