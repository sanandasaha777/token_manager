Rails.application.routes.draw do
  namespace :v1 do
    resources :tokens, only: %i[create destroy] do
      get :assign, on: :collection

      member do
        put :unblock
        put :keep_alive
      end
    end
  end
end
