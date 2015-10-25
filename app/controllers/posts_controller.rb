class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
  	@post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = @current_user._id 
    @post.save
  	respond_to do |format|
  		if @post.save
  			format.html { redirect_to :controller => 'home', :action => 'index', notice: 'Post was successfully created.'}
  			format.json { render :show, status: :created, location: @post }
  		else
  			format.html { render :new }
  			format.json { render json: @post.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :score, :user_id, :id, :post)
    end

end
