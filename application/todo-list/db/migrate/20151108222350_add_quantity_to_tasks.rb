class AddQuantityToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :quantity, :integer, :default => 1
  end
end
