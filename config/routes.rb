Rails.application.routes.draw do
 root "trips#index"
 resourses :users do
resourses :trips
 end
  resourses :trips do
respourse :locations
 end
 resourses :locations do
  resourses :address
 end


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
