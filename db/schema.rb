# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130516020051) do

  create_table "process_stats", :force => true do |t|
    t.integer  "system_process_id"
    t.float    "rss"
    t.float    "pcpu"
    t.float    "pmem"
    t.integer  "threads"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "process_stats", ["system_process_id"], :name => "index_process_stats_on_system_process_id"

  create_table "system_processes", :force => true do |t|
    t.string   "name"
    t.text     "command"
    t.string   "user"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "time_length"
    t.integer  "interval"
  end

end
