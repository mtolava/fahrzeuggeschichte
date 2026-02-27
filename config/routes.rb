Rails.application.routes.draw do
  resource :session, only: [ :new, :create, :destroy ]
  resources :passwords, param: :token, only: [ :new, :create, :edit, :update ]

  root "vehicles#index"

  resources :owners do
    resources :vehicles, only: [ :new, :create ]
  end

  resources :vehicles, only: [ :index, :show, :edit, :update ] do
    resources :visits, only: [ :new, :create ]
  end

  resources :visits, only: [ :index, :show, :edit, :update ] do
    resources :inspections, only: [ :new, :create, :edit, :update ]
    resources :diagnoses, only: [ :new, :create, :edit, :update ]
  end
end
