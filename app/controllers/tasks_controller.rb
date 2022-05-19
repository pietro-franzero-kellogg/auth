class TasksController < ApplicationController
  def index
    @tasks = Task.find_by({"user_id" => session["user_id"]})
    @task = Task.new
  end

  def create
    @task = Task.new
    @task["description"] = params["task"]["description"]
    @task["user_id"] = @current_user["id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    if @current_user["id"] = @tasks["user_id"]
      @task.destroy
    end
    redirect_to "/tasks"
  end
end
