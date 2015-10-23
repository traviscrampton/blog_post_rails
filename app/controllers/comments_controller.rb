class CommentsController < ApplicationController


  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = @user

    if @comment.save
      redirect_to post_path(@post)
    else
      @comment.errors.full_messages.each { |msg| string += msg + ". "}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
