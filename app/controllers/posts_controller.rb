class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :approve]

	def index
		@posts = Post.posts_by(current_user).page(params[:page]).per(10)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to @post, notice: "Post created successfully"
		else
			render :new
		end
	end

	def edit
		authorize @post
	end

	def update
		authorize @post
		if @post.update(post_params)
			redirect_to @post, notice: "Post updated successfully"
		else
			render :edit
		end
	end

	def show
	end

	def destroy
		@post.destroy
		redirect_to posts_path, notice: "Post deleted successfully"
	end

	def approve
		authorize @post
		@post.approved!
		redirect_to root_path, notice: 'Post has been approved successfully'
	end

	private
	
	def post_params
		params.require(:post).permit(:date, :rationale, :status, :overtime_request)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
