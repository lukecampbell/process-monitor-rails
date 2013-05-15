class CreateSystemProcesses < ActiveRecord::Migration
  def change
    create_table :system_processes do |t|
      t.integer :id
      t.string :name
      t.text :command
      t.string :user

      t.timestamps
    end
  end
end
