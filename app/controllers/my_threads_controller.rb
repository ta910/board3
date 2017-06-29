class MyThreadsController < ApplicationController

  def index
    @threads = MyThread.all
  end

  def new
    @thread = MyThread.new
  end

  def create
    @thread = current_user.my_threads.new(title: params.require(:my_thread)[:title])
    if @thread.save
      redirect_to my_threads_path
    else
      render :new
    end
  end

  def edit
    thread
  end

  def update
    if thread.update(thread_params)
      redirect_to my_threads_path
    else
      render :new
    end
  end

  def destroy
    thread.destroy
    redirect_to my_threads_path
  end

  private

  def thread
    @thread ||= MyThread.find(params[:id])
  end

  def thread_params
    params.require(:my_thread).permit(:title)
  end

end
