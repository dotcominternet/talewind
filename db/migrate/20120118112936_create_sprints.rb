class CreateSprints < ActiveRecord::Migration
  def self.up
    create_table :sprints do |t|
      t.string :name
      t.string :goal
      t.date :start
      t.date :end
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :sprints
  end
end
