class AddCompletedToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :completed, :datetime
  end

  def self.down
    remove_column :tasks, :completed
  end
end
