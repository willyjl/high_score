Rails.application.routes.draw do
  resources :scores, except: [:new, :update, :edit]
  resources :users, only: [:index, :show]
end
