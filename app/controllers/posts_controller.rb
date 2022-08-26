class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    if @post.save
      redirect_to user_posts_path(@user.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
