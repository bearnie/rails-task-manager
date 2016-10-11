class TasksController < ApplicationController

  # methode specifique qui permet d'appeler implicitement
  # find_task dans les methodes definies

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    # attention : j'appelle la methode de classe .all
    # sur le modele Task
    # cette variable reçoit un hash d'elements
    # d'ou le pluriel, ne pas confondre avec la variable
    # @task qui reçoit un objet task
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    # Rails oblige a rediriger vers la methode privee
    # qui definit task_params
    @task = Task.new(task_params)
    # met une branche pour renvoyer vers une page si
    # le nouvel objet est sauve
    # renvoie vers la page new si le champ :name est vide
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  # la mise a jour se passe en deux temps
  # 1- on recupere l'id de la tache a modifier avec edit
  def edit
  # la methode est vide car elle est alimentee par le
  # before_task vers la methode privee find_task
  end

  # 2 - on met a jour l'enregistrement avec la methode update
  def update
    @task.update(task_params)
    if @task.save
      redirect_to tasks_path #redirige vers tasks#index
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

end

private

def find_task
  # methode privee qui permet d'afficher les taches et evite
  # la saisie de code identique dans plusieurs fonctions simillaires
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:name)
end
