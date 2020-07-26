Rails.application.routes.draw do
  get 'api/v1/investment' => 'api/v1/investment#show'
end
