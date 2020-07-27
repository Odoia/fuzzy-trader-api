Rails.application.routes.draw do
  get 'api/v1/investment' => 'api/v1/investment#show'

  post 'api/v1/wallet' => 'api/v1/wallet#create'
  get 'api/v1/wallet' => 'api/v1/wallet#index'
end
