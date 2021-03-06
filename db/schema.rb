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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140702181650) do

  create_table "articles", force: true do |t|
    t.string   "food"
    t.string   "delivery"
    t.string   "tradition"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "food1"
    t.string   "food2"
    t.datetime "arrival"
    t.datetime "departure"
    t.integer  "people"
  end

  add_index "articles", ["post_id"], name: "index_articles_on_post_id"

  create_table "bankets", force: true do |t|
    t.datetime "arrival"
    t.datetime "departure"
    t.integer  "places"
    t.integer  "price"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bankets", ["post_id"], name: "index_bankets_on_post_id"

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "lastname"
    t.integer  "phone"
    t.string   "email"
    t.text     "additional_info"
    t.integer  "price"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["post_id"], name: "index_contacts_on_post_id"

  create_table "posts", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "begin"
    t.integer  "people"
    t.datetime "end"
    t.integer  "price"
    t.text     "text"
  end

end
