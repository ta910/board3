class CommentsController < ApplicationController

  before_action :set_thread, except: [:show, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = @thread.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to my_thread_comments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to my_thread_comments_path
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to my_thread_comments_path
  end

  private

  def set_thread
    @thread = MyThread.find(params[:my_thread_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title).merge(user_id: current_user.id, my_thread_id: params[:my_thread_id])
  end

end
