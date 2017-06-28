class MyThreadsController < ApplicationController

  before_action :set_thread, only: [:edit, :update, :destroy]

  def index
    @threads = MyThread.all
  end

  def new
    @thread = MyThread.new
  end

  def create
    @thread = currnt_user.my_threads.new(title: params[:title])
    if @thread.save
      redirect_to my_threads_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @thread.update(thread_params)
      redirect_to my_threads_path
    else
      render :new
    end
  end

  def destroy
    @thread.destroy
    redirect_to my_threads_path
  end

  private

  def set_thread
    @thread = MyThread.find(params[:id])
  end

  def thread_params
    params.require(:my_thread).permit(:title)
  end

end
