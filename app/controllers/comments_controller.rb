class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @comment, notice: t(:create)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:coment).permit(:content)
  end
end
