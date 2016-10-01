Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end

  devise_for :users

  #root to: 'home#index'

  resource :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  get "admin/users_count" => "admin#users_count"
end
