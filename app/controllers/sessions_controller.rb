class SessionsController < ApplicationController
 def new

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'      
    end
  end

  def destroy
    if session[:name].nil?

    else
      session.delete :name
    end
  end
end
