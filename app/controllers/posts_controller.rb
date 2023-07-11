class PostsController < ApplicationController

  http_basic_authenticate_with name:"afaq", password:"12345", except: [:index, :show]

  def index #for show all posts
@posts = Post.all
  end

  def new #for takecare of new posts and @post=Post.new for validation in new form
@post=Post.new
  end

  def create #for submitting the form
#render plain: params[:post].inspect

@post = Post.new(post_params)
if(@post.save)
  flash[:notice]="Post created successfully"
redirect_to @post
else
render 'new'
end
  end


  def show #for show all individul posts
@post=Post.find(params[:id])
  end


  def edit
    @post=Post.find(params[:id])

  end


  def update
    @post=Post.find(params[:id])
    if(@post.update(post_params))
      flash[:notice]="Post updated successfully"
    redirect_to @post
    else
    render 'edit'
    end
      end

def destroy
  @post=Post.find(params[:id])
  @post.destroy
  flash[:notice]="Post deleted successfully"
  redirect_to posts_path
    end


  private def post_params
params.require(:post).permit(:title , :body)
  end
end
