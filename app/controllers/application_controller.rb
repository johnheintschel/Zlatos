class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_user

  def current_user
    if @current_user.nil? && !session[:user_id].nil?
      @current_user = User.find(session[:user_id])   
    end
  end
  helper_method :current_user
  
  def require_user
    if current_user
      return true
    end
    flash[:notice] = 'You must be logged in to view this page.'
    redirect_to root_url
  end 
end
