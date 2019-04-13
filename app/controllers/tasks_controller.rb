class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "Updated [#{@task.name}] 😀"
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
        logger.debug "@@@@task: #{@task.attributes.inspect}@@@@"
        Rails.application.config.custom_logger.debug 'custom_loggerに出力'
        redirect_to @task, notice: "task [#{@task.name}] was saved!👏"
    else
        render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Deleted [#{@task.name}] 😈"
  end

  private 

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end

