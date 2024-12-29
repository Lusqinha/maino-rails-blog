class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to @post, notice: t("comments.create.success")
    else
      redirect_to @post, alert: t("comments.create.failure")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
