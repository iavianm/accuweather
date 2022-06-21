Rails.application.routes.draw do
  get 'health/index'
  root 'weather#index'
  resources :weather, only: [:index] do
    collection do
      resources :historical, only: [:index] do
        collection do
          get 'min'
          get 'max'
          get 'avg'
        end
      end
      get 'current'
      get 'by_time'
    end
  end
end