class TasksController < ApplicationController
    def index
        @tasks = Task.order(title: :desc)
        render json: {
            status: 'EXITOSO',
            message: ' Tareas cargadas',
            data: @tasks
        }, status: :ok
    end

    def show 
        task
        render json: {
            status: 'EXITOSO',
            message: ' Tarea vista',
            data: task
        }, status: :ok
    end

    def create
        #referencia al modelo
        @task = Task.new(task_params) 
        
        if @task.save
            render json: {
            status: 'Exitoso',
            message: 'tarea creada',
            data: @task
        }, status: :ok 
        else
            render json: {
                status: 'Fallo',
                message: 'tarea no creada',
                data: task.errors
            }, status: :unprocecessable_entity 
        end
    end

    def destroy
        task 
        if task.destroy
                render json: {
                status: 'Exitoso',
                message: 'tarea eliminado',
                data: task
            }, status: :ok
            else
                render json: {
                    status: 'Fallo',
                    message: 'task no eliminado',
                    data: task.errors
                }, status: :unprocecessable_entity 
        end
    end

    def edit 
        task
    end

    def update
        task 
        if task.update_attributes(task_params)
            render json: {
                status: 'Exitoso',
                message: 'tarea actualizada',
                data: task
            }, status: :ok 

        else
            render json: {
                status: 'Falló',
                message: 'tarea no actualizado',
                data: task.errros
            }, status: :unprocessable_entity
        end
    end

    private

    def task_params
        params.permit(:title, :descrition, :start_date, :end_date)
    end

    def task
        @task ||=  Task.find(params[:id])
    end

end
