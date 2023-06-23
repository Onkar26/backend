class SessionsController < ApplicationController
  def create
    email = params[:email]
    password = params[:password]

    # Perform login authentication logic here
    user = User.find_by(email: email, password: password)
    puts user_params

    if user
      render json: { message: "Login successful" }
    else
      render json: { error: "Invalid credentials" }, status: 401
    end
  end

  def user_params
    params.permit(:email, :password)
  end
end
