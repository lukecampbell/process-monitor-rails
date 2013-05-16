class AddTimeToSystemProcess < ActiveRecord::Migration
  def change
    add_column :system_processes, :time_length, :integer
    add_column :system_processes, :interval, :integer
  end
end
