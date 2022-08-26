class CommentsController < ApplicationController
  def post_comment
    post = Post.find(params[:id])
    @comment = current_user.comments.new(text: params[:comment])
    @comment.post_id = post.id
    @comment.save
    redirect_to "/user/#{current_user.id}/post/#{post.id}"
  end
end
