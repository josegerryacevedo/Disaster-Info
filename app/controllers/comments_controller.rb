class CommentsController < ApplicationController
  before_action :set_disaster
  before_action :set_comment, only: [:edit, :update, :destroy]


  def index
    @comments = @disaster.comments.includes(:user)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.disaster = @disaster
    @comment.user = current_user
    if @comment.save
      redirect_to disaster_comments_path(@disaster), notice: 'Comment was successfully submitted'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to disaster_comments_path(@disaster, @comment)
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      redirect_to disaster_comments_path(@disaster)
    end
  end

  private

  def set_comment
    @comment = @disaster.comments.find(params[:id])
  end

  def set_disaster
    @disaster = Disaster.find params[:disaster_id]
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
