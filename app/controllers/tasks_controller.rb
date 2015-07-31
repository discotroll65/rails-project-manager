class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new()
    @project = Project.find(params[:project_id])
  end

  def create
    task_attrs = task_params[:tasks_attributes][0]
    @task = Task.new(task_attrs)
    @project = Project.find(task_attrs[:project_id])
    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: 'Task successfully added to project.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @project = @task.project
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@project) }
      format.json { head :no_content }
    end

  end

  def task_params
    params.require(:project).permit(
      tasks_attributes:[:description, :name, :status, :project_id ]
    )
  end
end
