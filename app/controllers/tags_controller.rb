class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path, notice: t('flash.tag.create.notice')
    else
      render :new, alert: t('flash.tag.create.alert')
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: t('flash.tag.update.notice')
    else
      render :edit, alert: t('flash.tag.update.notice')
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: t('flash.tag.destroy.notice')
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
