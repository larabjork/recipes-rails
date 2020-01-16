# Rails.application.routes.draw do
#   root to: 'recipes#index'
#   resources :recipes do
#     member do
#       post :add
#     end
#   end
#   resources :ingredients do
#     member do
#       post :add
#     end
#   end
# end


Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes do
    resources :ingredients
  end
  resources :ingredients do
    resources :recipes
  end
end
