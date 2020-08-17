# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def after_update_path_for(_resource)
    user_path(current_user)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_without_current_password(user_params)
      sign_in @user, bypass: true
      set_flash_message :notice, :updated
      redirect_to after_update_path_for(@user)
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:email, :address, :postcode, :biography, :password, :password_confirmation)
  end
end
