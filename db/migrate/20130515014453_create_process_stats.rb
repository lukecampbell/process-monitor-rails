class CreateProcessStats < ActiveRecord::Migration
  def change
    create_table :process_stats do |t|
      t.integer :system_process_id
      t.float :rss
      t.float :pcpu
      t.float :pmem
      t.integer :threads
      t.timestamps
    end
    add_index :process_stats, :system_process_id
  end
end
