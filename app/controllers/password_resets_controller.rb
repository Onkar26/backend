class PasswordResetsController < ApplicationController
  def edit
    @user = User.find_by(reset_token: params[:reset_token], email: params[:email])

    puts @user.password

    render json: { password: @user.password }
  end
end
