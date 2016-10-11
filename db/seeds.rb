# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# en premier, detruire les elements qui pourraient etre dans la base
# on appelle une methode de classe sur le modele
Task.destroy_all

# Creation de plusieurs objets tasks
# la methode Create ici est attachee à ActiveRecord
# et gere implicitement la creation du nouvel objet et
# sa montée en base
# ne pas confondre avec la methode Create du Controleur
# qui est differente
task1 = Task.create(name: "Faire la vaisselle", done: false)
# la methode create gere les deux actions ci-dessous :
task2 = Task.new(name: "Faire reviser Guillaume", done: false)
task2.save
task3 = Task.create(name: "Réviser Rails CRUD", done: false)

# rails db:seed + console Task.all pour verif si presence des
# enregistrement : ok
