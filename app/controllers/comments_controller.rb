class CommentsController < ApplicationController
http_basic_authenticate_with name: "ds", password: "112", only: :destroy 
 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
 def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
	 params[:comment] 
      #params.require(:comment).permit(:commenter, :body)
    end

end
