Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end
end
