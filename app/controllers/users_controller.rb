class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.send_confirmation_email!
      redirect_to root_path, notice: "Please check your email for confirmation instructions."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_signed(params[:token], purpose: :confirm_email)

    if @user.present?
      @user.confirm!
      redirect_to root_path, notice: "Your account has been confirmed."
    else
      redirect_to new_user_path, alert: "Invalid token."
    end
  end

  def confirm
    @user = User.find_signed(params[:token])

    if @user.present?
      @user.confirm!
      redirect_to root_path, notice: "Your account has been confirmed."
    else
      redirect_to new_user_path, alert: "Invalid token."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :subscribed_to_newsletter)
  end
end