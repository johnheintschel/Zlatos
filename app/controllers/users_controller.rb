class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :movies, :posts]
  skip_before_filter :require_user, :only => [:new, :create, :show]

  def index
  	@users = User.all
  end

  def posts
    @posts = @user.posts
  end

  def movies
    @movies = @user.movies
  end

  def show
    current_user
  end


  def new
  	@user = User.new
  end

  def edit
  end

  def create
  	@user = User.new(user_params)
    @user.slug = @user.username.downcase.gsub(' ','-')
  	respond_to do |format|
  		if @user.valid?
        @user.save
        session[:user_id] = @user.id
        flash[:success] = 'Welcome new user!'
  			format.html { redirect_to @user}
  			format.json { render :show, status: :created, location: @user }
  		else
  			format.html { render :new }
  			format.json { render json: @user.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      flash[:success] = 'User was successfully destroyed.'
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :slug, :username, :password, :password_confirmation, :avatar )
    end
end
