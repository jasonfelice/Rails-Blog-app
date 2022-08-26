class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = current_user.comments.new(text: params[:comment])
    @comment.post_id = @post.id
    if @comment.save
      redirect_to user_post_path(current_user.id, @post.id)
    else
      render :new
    end
  end
end
