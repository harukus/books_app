class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create update]

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @resource == 'reports'
      @report = @commentable
    else
      @book = @commentable
    end
    @comment.save
    redirect_to @commentable, notice: 'コメントを入力してください'
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @commentable
    else
      render :edit
    end
  end

  private

  def set_commentable
    @resource, id = request.path.split('/')[1, 2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end
