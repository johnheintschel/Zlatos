class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user] = user
      flash[:success] = "Logged in!"
      redirect_to user
      
    else
      flash[:alert] = "Invalid email or password"
      render "new"
    end  
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_url
  end
end
