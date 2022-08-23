Rails.application.routes.draw do
  namespace :api do
    resources :posters
  end
end
