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

  def destroy
    @comment = Comment.find(params(:id))
    @comment.destroy
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    redirect_to user_path(current_user.id), notice: 'Comment deleted.'
  end
end
