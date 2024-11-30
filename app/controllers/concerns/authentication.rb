module Authentication
  extend ActiveSupport::Concern

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end
end