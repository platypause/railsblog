class PostsController < ApplicationController
	def index
		@post = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@comment = Comment.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to posts_path
			flash[:posted] = "New post created"
		else
			flash[:correctPost] = "Please fill the form correctly. \n Title should contain at least 5 characters"
			render 'new'
		end
	end

	def update 
		@post = Post.find(params[:id])
		@post.update(post_params)
		flash[:updated] = "Post updated"
		redirect_to posts_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:deleted] = "Post deleted"
		redirect_to	posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end

end