class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: t('flash.crud.create.notice', resource: t('activerecord.models.post'))
    else
      render 'new', alert: t('flash.tag.create.alert', resource: t('activerecord.models.tag').downcase)
    end
  end

  def update
    @post.slug = nil  # !!!
    if @post.update(post_params)
      redirect_to @post, notice: t('flash.crud.update.notice', resource: t('activerecord.models.post'))
    else
      render 'edit', alert: t('flash.tag.update.alert', resource: t('activerecord.models.tag').downcase)
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: t('flash.crud.delete.notice', resource: t('activerecord.models.post'))
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :published, tag_ids: [])
  end
end
