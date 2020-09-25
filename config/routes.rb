Rails.application.routes.draw do
  namespace :v1 do
    resources :tokens, only: :create
  end
end
