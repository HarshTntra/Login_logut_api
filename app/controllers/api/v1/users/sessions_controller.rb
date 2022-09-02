# class Api::V1::Users::SessionsController < ApplicationController
# end
# frozen_string_literal: true

module Api
  module V1
    module Users
      # Session contoller
      class SessionsController < Devise::SessionsController
        include ApiResponder

        protect_from_forgery with: :null_session, prepend: true
        skip_before_action :verify_authenticity_token, only: [:create]
        skip_before_action :verify_signed_out_user
        respond_to :json

        def create
          binding.pry
          if self.resource = warden.authenticate!()
            binding.pry
            sign_in(User, resource)
            render_success({ user: serialized_json(resource) }, I18n.t('devise.sessions.signed_in'))
          else
            render_error(I18n.t('devise.failure.invalid', authentication_keys: 'email'))
          end
        end

        def destroy
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          if signed_out
            render_success({ user: serialized_json(resource) }, I18n.t('devise.sessions.signed_out'))
          else
            render_error(I18n.t('errors.messages.unable_to_sign_out'))
          end
        end

        private

        def serialized_json(details)
          UserSerializer.new(details).serializable_hash[:data]
        end
      end
    end
  end
end
