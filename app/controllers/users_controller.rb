class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.authenticate(params[:user][:password]) && user.authenticate(params[:user][:password_confirmation])
      user.save
      session[:user_id] = user.id
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
