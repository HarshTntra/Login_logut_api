# Rails.application.routes.draw do
#   devise_for :users
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end
# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        passwords: 'api/v1/users/passwords',
        registrations: 'api/v1/users/registrations'
      }
      devise_scope :user do
        post 'users/invitation/accept_invite' => 'users/invitations#accept_invite'
      end
    end
  end
end
