class PostsController < ApplicationController
 http_basic_authenticate_with name: "ds", password: "112", except: [:index, :show] 
 def new
   @post = Post.new
 end
 def create
  @post=Post.new(post_params)
  if @post.save
    redirect_to @post
   else
    render 'new'
  end
 end
 def show
  @post=Post.find(params[:id])
 end
 def index
  @posts = Post.all
 end
 def edit
  @post = Post.find(params[:id])
 end 
 def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end
def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end
 private
  def post_params
   params[:post]
  # params.require(:post).permit(:title, :text) 
  #тут ошибка т.к. нет gem strong_paramerers p.s. добавил этот гем и все равно
 
  end
end
