Rails.application.routes.draw do
  scope ':garage', defaults: { format: :json } do
    resources :cars, only: [ :index, :create ]
  end
  resources :cars, only: [ :show, :destroy ]

  get '*a', :to => 'application#routing_error'
end
