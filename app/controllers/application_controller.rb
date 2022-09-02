class ApplicationController < ActionController::API
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :null_session
    include ActionController::MimeResponds
    
    private
    def after_sign_out_path_for(resource_or_scope)
        root_path
      end
end
