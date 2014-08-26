class CommentsController < ApplicationController

	http_basic_authenticate_with name: "counterall", password: "mj23kb8i3", only: :destroy

	def create

		@post = Post.find(params[:post_id])
    	@comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    	redirect_to post_path(@post)
	
	end


	def destroy

    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to post_path(@post)
    
  	end


end
