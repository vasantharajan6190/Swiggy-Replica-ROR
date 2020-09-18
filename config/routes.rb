Rails.application.routes.draw do
  match 'check/:id' => 'homepage#check' , via: [:post], :as => :check
  match '/paytm_payment' => 'paytm#start_payment', via: [:post], :as => :paytm_payment
  match '/confirm_payment' => 'paytm#verify_payment', via: [:post]
  devise_for :users
  get '/landingpage/map/:id', to: 'landingpage#map', :as => :map
  resources:admin
 resources :homepage
 resources :landingpage
 resources :cart
 resources :orders
 authenticated :user do
  root 'landingpage#index', as: "authenticated_root"
 end
  root 'homepage#index'
end
