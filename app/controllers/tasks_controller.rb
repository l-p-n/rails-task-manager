class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to instantiate the form_for (in the view file)
  end

  def create
    # We cannot save data without using Strong Params (see method below)
    @task = Task.new(strong_params)
    @task.save
    # no need for app/views/tasks/create.html.erb
    redirect_to task_path(@task.id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(strong_params)
    # no need for app/views/tasks/update.html.erb
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
