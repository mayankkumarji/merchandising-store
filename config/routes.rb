Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: %i(index update) do
        get :chargeable_price, on: :collection
      end
   end
  end
end
