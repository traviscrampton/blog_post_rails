class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @user = User.find(current_user)
    @comment = @post.comments.new(comment_params)
    @comment.user_id = @user.id
    if @comment.save
      respond_to do |format|
        format.html {redirect_to posts_path}
        format.js
      end
    else
      render post_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :show
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
