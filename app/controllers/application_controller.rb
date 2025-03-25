class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        
      #Rails.logger.debug " Devise Parameters Permitted!"
      #Rails.logger.debug " Received Parameters: #{params[:user].inspect}"
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
    end

    protect_from_forgery with: :exception
end
