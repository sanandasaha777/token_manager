Rails.application.routes.draw do
  namespace :v1 do
    resources :tokens, only: %i[create destroy]
  end
end
