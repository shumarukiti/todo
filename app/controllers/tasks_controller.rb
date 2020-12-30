class TasksController < ApplicationController

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        @task.board_id = params[:board_id]
        @task.save
        redirect_to board_path(params[:board_id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to board_path(params[:board_id])
        else
            flash.noe[:error] = ''
        end
    end

    private
        def task_params
            params.require(:task).permit(
                :content,
                :deadline,
                :title)
        end
end