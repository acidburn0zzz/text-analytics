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

ActiveRecord::Schema.define(:version => 20130401153138) do

  create_table "brains", :force => true do |t|
    t.text     "classifier"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "classifier_type"
    t.string   "name"
  end

  create_table "phrases", :force => true do |t|
    t.text     "text"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "brain_id"
  end

  create_table "words", :force => true do |t|
    t.text     "text"
    t.integer  "count"
    t.boolean  "deleted"
    t.text     "cloud",      :limit => 255
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "stem"
  end

end
