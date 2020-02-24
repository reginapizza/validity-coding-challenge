Rails.application.routes.draw do
  root 'main#home'

  namespace :api do
   namespace :v1 do
    resources :email_verifications
   end
  end
end
