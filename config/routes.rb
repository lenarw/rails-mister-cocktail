Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [ :index, :new, :create ]
  end
  resources :doses, only: [ :show, :destroy ]

  root 'cocktails#index'

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
