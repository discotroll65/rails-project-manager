class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :name, :status)
  end
end
