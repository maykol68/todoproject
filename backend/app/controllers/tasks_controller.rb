class TasksController < ApplicationController

    def index
      @tasks = Task.order(name: :asc)
    end

    def show
        task
    end

    def new
        @task = Task.new
        
    end
    def edit
        authorize! task
    end
    def create
        @task = Task.new(task_params)
        
            if @task.save
                redirect_to tasks_params, notice: 'Task was successfully created.'
                
            else
                render :new, status: :unprocessable_entity
            end
    end

    def update
        authorize! task
        if task.update(task_params)

            redirect_to tasks_params, notice: 'Task was successfully updated.'
        else
            render :edit, status: :unprocessable_entity
    end

    def destroy
        authorize! task
        task.destroy
        redirect_to tasks_path, notice: 'Task was successfully destroyed.' status: :see_other
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :start_date, :end_date)
    end

    def task
        @task ||= Task.find(params[:id])
    end

end
