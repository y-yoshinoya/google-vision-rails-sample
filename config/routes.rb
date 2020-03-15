Rails.application.routes.draw do
  resources :analyses
  root 'analyses#index'
end
