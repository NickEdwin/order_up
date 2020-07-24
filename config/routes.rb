Rails.application.routes.draw do

  resources :chefs do
    resources :dishes
    resources :ingredients
  end

  resources :dishes
end
