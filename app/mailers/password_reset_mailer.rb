class PasswordResetMailer < ApplicationMailer
  def reset_password_email(user)
    @user = user
    mail(to: user.email, subject: "Password Reset Instructions")
  end
end