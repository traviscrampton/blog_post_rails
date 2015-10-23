class TagsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)
    @post.tags.push(@tag)
    if @tag.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  def edit
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to post_path(@post)
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
