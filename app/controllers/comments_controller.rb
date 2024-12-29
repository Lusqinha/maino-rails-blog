class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to @post, notice: "Comentário adicionado com sucesso!"
    else
      redirect_to @post, alert: "Erro ao adicionar o comentário."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
