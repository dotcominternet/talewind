class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :story_id
      t.text :description
      t.boolean :is_story
      t.integer :user_id
      t.string :status
      t.integer :estimate
      t.integer :actual

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
