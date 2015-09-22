class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      @user = user
      session[:user_id] = user
      respond_to do |format|

        format.html { redirect_to :controller => 'home', :action => 'index', session[:user_id] => user}
      end
    else
      render "new"

    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
