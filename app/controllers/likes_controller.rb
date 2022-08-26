class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.post_id = @post.id
    @like.author_id = current_user.id
    @like.save
    redirect_to "/user/#{current_user.id}/post/#{@post.id}"
  end
end
