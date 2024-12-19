class PasswordResetController < ApplicationController
  def new_password
    @token = params[:token]
  end

  def reset_password
    @user = User.find_signed(params[:token])

    new_password = params[:new_password]
    new_password_confirmation = params[:new_password_confirmation]

    if !@user.present? || !@user.password_reset_requested
      redirect_to new_password_reset_path, alert: "Invalid token."
    elsif new_password != new_password_confirmation
      redirect_to new_password_reset_path, alert: "Two password inputs must match."
    elsif !helpers.valid_password?(new_password)
      redirect_to new_password_reset_path, alert: "User password must include at least one lowercase letter, one uppercase letter, one digit, and needs to be minimum 8 characters long."
    else
      @user.password = new_password
      @user.password_reset_requested = false
      @user.save!
      redirect_to root_path, notice: "Your password is successfuly changed!"
    end
  end

  def change_password
  end

  def request_reset
    @user = User.find_by_email(params[:email])

    if @user && @user.confirmed?
      @user.send_reset_password_request
      redirect_to "/change_password", notice: "Verify your email in order to proceed"
    else
      redirect_to "/change_password", alert: "User with provided email doesen't exist"
    end
  end

  def confirm_email
    @user = User.find_signed(params[:token])

    if @user.present?
      @user.update!(password_reset_requested: true)
      redirect_to new_password_path(params[:token])
    else
      redirect_to "/change_password", alert: "Invalid token."
    end
  end
end