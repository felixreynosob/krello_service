Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :syncs, only: [:index, :new, :create]

  resources :boards do
    resources :lists do
      resources :cards
    end
  end

  root 'welcome#index'
end
