class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning

  before_action :user_permitted_params, if: :devise_controller?

  def user_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
