Rails.application.routes.draw do
  root to: 'topics#index'
  resources :blacklists
  resources :topics do
    resources :descriptions
  end
end
