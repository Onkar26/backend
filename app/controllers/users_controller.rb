class UsersController < ApplicationController
  def create
    email = params[:email]
    password = params[:password]

    existing_user = User.find_by(email: email)

    if existing_user
      render json: { error: "Email already exists" }, status: 409
    else
      new_user = User.create(email: email, password: password)

      if new_user.save
        render json: { message: "Sign up successful" }
      else
        render json: { error: "Internal server error" }, status: 500
      end
    end
  end

  def forgot_password
    email = params[:email]

    user = User.find_by(email: email)

    if user
      reset_token = generate_reset_token
      user.update(reset_token: reset_token)

      send_reset_password_email(user)

      render json: { message: "Password reset instructions sent to your email" }
    else
      render json: { error: "Email not found" }, status: 404
    end
  end

  private

  def generate_reset_token
    characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    length = 32
    reset_token = ""

    length.times do
      reset_token += characters[rand(characters.length)]
    end

    reset_token
  end

  def send_reset_password_email(user)
    puts user.as_json

    PasswordResetMailer.reset_password_email(user).deliver_now
  end
end
  