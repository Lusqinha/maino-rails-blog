class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @tags = Tag.all.pluck(:name)
    if params[:tag].present?
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(3)
    else
      @posts = Post.order(created_at: :desc).page(params[:page]).per(3)
    end
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
      @post.update_tags(params[:post][:tag_names])
      redirect_to @post, notice: t("posts.create.success")
    else
      render :new, alert: t("posts.create.failure"), status: :unprocessable_entity
    end
  end

  def edit; end

  def upload
    file = params[:file]
    redirect_to new_post_path, alert: t("posts.upload.failure") if file.blank?
    redirect_to new_post_path, alert: t("posts.upload.invalid_format") unless file.content_type == "text/plain"

    file_text = file.read
    puts file_text
    if Post.upload_content_valid?(file_text)
      puts "POST VALIDADO"
      CreatePostsFromFileContentJob.perform_async(file_text, current_user.id)
      redirect_to posts_path, notice: t("posts.upload.success")
    else
      redirect_to new_post_path, alert: t("posts.upload.invalid")
    end
  end

  def update
    if @post.update(post_params)
      @post.update_tags(params[:post][:tag_names])
      redirect_to @post, notice: t("posts.update.success")
    else
      render :edit, alert: t("posts.update.failure"), status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: t("posts.destroy.success")
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
