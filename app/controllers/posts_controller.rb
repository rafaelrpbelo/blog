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
			redirect_to @post, notice: t('flash.post.create.notice')
		else
			render 'new'
		end
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: t('flash.post.update.notice')
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_url, notice: t('flash.post.delete.notice')
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end
end