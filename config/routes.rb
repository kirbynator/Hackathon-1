Rails.application.routes.draw do
 root "trips#index"
 resources :users do
resources :trips
 end
  resources :trips do
resource :locations
 end
 resources :locations do
  resources :address
 end


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
