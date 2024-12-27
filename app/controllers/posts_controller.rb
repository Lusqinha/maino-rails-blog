class PostsController < ApplicationController
end
class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post criado com sucesso!"
    else
      render :new, alert: "Erro ao criar o post."
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post atualizado com sucesso!"
    else
      render :edit, alert: "Erro ao atualizar o post."
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post excluído com sucesso!"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
