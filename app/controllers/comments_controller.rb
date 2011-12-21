class CommentsController < ApplicationController

    has_basic_authenticate_with :name => 'admin',:password => 'admin',:only = 'destroy'

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirct_to post_path(@post)
	end
end
