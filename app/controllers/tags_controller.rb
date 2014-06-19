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
      redirect_to tags_path, notice: t('flash.crud.create.notice', resource: t('activerecord.models.tag'))
    else
      render :new, alert: t('flash.crud.create.alert', resource: t('activerecord.models.tag').downcase)
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: t('flash.crud.update.notice', resource: t('activerecord.models.tag'))
    else
      render :edit, alert: t('flash.crud.update.alert', resource: t('activerecord.models.tag').downcase)
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: t('flash.crud.destroy.notice', resource: t('activerecord.models.tag'))
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
