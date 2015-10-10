class HomeController < ApplicationController
  skip_before_filter :require_user
  def index
  	current_user
  end
end
