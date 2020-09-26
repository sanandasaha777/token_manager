Rails.application.routes.draw do
  namespace :v1 do
    resources :tokens, only: %i[create destroy] do
      get :assign, on: :collection
      put :unblock, on: :member
    end
  end
end
