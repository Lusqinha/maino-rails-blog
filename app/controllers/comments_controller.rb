class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

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
