class TasksController < ApplicationController
    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        @task.board_id = params[:board_id]
        @task.save
        redirect_to board_path(params[:board_id])
    end

    private
        def task_params
            params.permit(
                :content,
                :deadline,
                :title)
        end
end