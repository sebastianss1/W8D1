Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :new, :create, :show] 

  resource :session, only: [:new, :create, :destroy]

  resources :subs, except: [:edit, :update]

  resources :posts, except: [:index]
end
