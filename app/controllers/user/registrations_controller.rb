class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  private
  # protected ? 
  def configure_permitted_parameters
    devise_parameter_sanitize.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitize.permit(:account_update, keys: [:first_name, :last_name   ])
  end
end