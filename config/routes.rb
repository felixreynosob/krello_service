Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :syncs, only: [:new, :create, :destroy]

  resources :boards, only: [:show, :index] do
    resources :lists, only: [:show, :index]  do
    #   resources :cards
    end
  end

  root 'welcome#index'
end
