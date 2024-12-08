module UserHelper
  def valid_password?(password)
    password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/)
  end
end