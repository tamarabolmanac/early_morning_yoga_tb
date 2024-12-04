class SessionController < ApplicationController
  include Authentication

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        if @user.confirmed?
          login(@user)
          redirect_to root_path, notice: "Signed in."
        else
          flash.now[:alert] = "User email is not confirmed yet. Check your inbox!"
          render :new, status: :unprocessable_entity
        end
      else
        flash.now[:alert] = "Incorrect email or password."
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Signed out."
  end
end