class AddCreatedDateToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :created_date, :integer
  end
end
