class PostsController < ApplicationController
  def index
      @posts = Post.all
      @tags = Tag.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        flash[:alert] = "You Successfully Added A Post"
        redirect_to posts_path
      else
        render :new
      end
    end

    def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @tag = Tag.new
  end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        respond_to do |format|
          format.html {redirect_to posts_path}
          format.js
        end
      else
        render :edit
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end



  private
  def post_params
    params.require(:post).permit(:title, :description)
  end


end
