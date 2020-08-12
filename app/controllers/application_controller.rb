class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :logged_in?, :current_user_name

  private

  def after_sign_in_path_for(_resource)
    books_path
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  def logged_in?
    !!session[:user_id]
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[email password password_confirmation postcode address biography]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
