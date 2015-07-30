class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null:false
      t.text :description
      t.string :status, null:false
      t.integer :project_id, null:false

      t.timestamps
    end
    add_index :tasks, :project_id
    add_index :tasks, :status
  end
end
