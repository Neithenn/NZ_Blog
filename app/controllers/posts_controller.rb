class PostsController < ApplicationController
    before_filter :authenticate, :except => [ :index, :show ]

  def index

    if params[:tag]
      
        @posts = Post.tagged_with(params[:tag]).page(params[:page]).per_page(5)    

      else
        @posts = Post.all.page(params[:page]).per_page(5)    
    end

    
  end

  def admin
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, :notice => "all good"
    else
      render "new"
    end  
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
       redirect_to posts_path, :notice => "all good"
    else
      render "edit"
    end  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"
  
  end

  def post_params
  allow = [:title, :subtitle, :content, :img, :category, :tag_list]
  params.require(:post).permit(allow)
  end

    def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == "ezequiel" && password == "ezequiel"
    end
  end
end
