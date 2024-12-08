class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes
  MAILER_FROM_EMAIL = "earlymorningyoga@gmail.com"

  has_secure_password
  
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  validate :password_complexity

  def password_complexity
    if password.present? and !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, one digit, and needs to be minimum 8 characters long."
    end
  end

  def confirm!
    update_columns(confirmed_at: Time.current)
  end 

  def confirmed?
    confirmed_at.present?
  end

  def unconfirmed?
    !confirmed?
  end

  def generate_confirmation_token
    signed_id(expires_in: CONFIRMATION_TOKEN_EXPIRATION)
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    UserMailer.confirmation(self, confirmation_token).deliver_now
  end
end