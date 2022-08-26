class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = Comment.create(text: params[:comment])
    @comment.post = @post
    @comment.author = current_user
    redirect_to "/user/#{current_user.id}/post/#{@post.id}"
  end
end
