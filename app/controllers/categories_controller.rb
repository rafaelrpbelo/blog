class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: t('flash.category.create.notice')
    else
      render :new, alert: t('flash.category.create.alert')
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: t('flash.category.update.notice')
    else
      render :edit, alert: t('flash.category.update.notice')
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: t('flash.category.destroy.notice')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
