Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # lister toutes les taches
  # resources :tasks
  # # la creation d'une nouvelle tache se fait en deux temps
  # # 1- on instancie le nouvel objet Task
  get 'tasks/new', to: "tasks#new"
  # # 2- on le cree avec la methode adhoc du controleur
  post 'tasks', to: "tasks#create"

  get 'tasks', to: "tasks#index"


  # le as: "task" est obligatoire pour que l'url soit
  # creee avec un slash et pas un point...
  # inutile lorsqu'on utilise resources :tasks qul le fait
  # automagiquement
  get 'tasks/:id', to: "tasks#show", as: "task"


  get 'tasks/:id/edit', to: "tasks#edit", as: "edit"
  patch 'tasks/:id', to: "tasks#update"

  delete 'tasks/:id', to: "tasks#destroy", as: "destroy"


end
