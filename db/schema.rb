# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120126023329) do

  create_table "sprints", :force => true do |t|
    t.string   "name"
    t.string   "goal"
    t.date     "start"
    t.date     "end"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.text     "description"
    t.integer  "business_value"
    t.integer  "technical_value"
    t.integer  "sprint_id"
    t.string   "category"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "story_id"
    t.text     "description"
    t.boolean  "is_story"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "estimate"
    t.integer  "actual"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workday_minutes"
  end

end
