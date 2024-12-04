module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def authenticate_user!
    redirect_to login_path, alert: "You need to login to access that page." unless user_signed_in?
  end

  private

  def current_user
    @current_user ||= if session[:current_user_id]
                        User.find(session[:current_user_id])
                      else
                        nil
                      end
  end

  def user_signed_in?
    @current_user.present?
  end
end