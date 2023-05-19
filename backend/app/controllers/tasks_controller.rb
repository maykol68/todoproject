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
    end

    def create
        @task = Task.new(task_params)
        
            if @task.save
                render :show, status: :created, location: @task
                
            else
                render json: @task.errors, status: :unprocessable_entity
            end
    end

    def update

        if task.update(task_params)

            render :show, status: :ok, location: @task
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def destroy
        task.destroy
        head :no_content #status: :see_other
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :start_date, :end_date)
    end

    def task
        @task ||= Task.find(params[:id])
    end

end
