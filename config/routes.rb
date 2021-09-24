Rails.application.routes.draw do
  resources :rooms, only: [:index, :create]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
