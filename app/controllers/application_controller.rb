class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to page_index_path, :alert => exception.message
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :secret_code_indeifier, roles: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  # protected

  # def authenticate_user!
  #   if user_signed_in?
  #     super
  #   else
  #     redirect_to new_user_session_path, :notice => 'Admin Login Required.'
  #   end
  # end
end
