class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.text :description
      t.integer :businesss_value
      t.integer :technical_value
      t.integer :sprint_id
      t.string :category
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
