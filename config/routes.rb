Rails.application.routes.draw do
  resources :review2s
   resources :contact_forms

   resources :locations do
   resources :review2s
   end

  get 'contact_form/new'

  get 'contact_form/create'

  resources :comments
  devise_for :users
  resources :locations do
  	resources :reviews
  end 
  root 'locations#index'


  get 'search', :to=> 'locations#search'

  resources :users do
    member do
      get :confirm_email
    end
  end




end
