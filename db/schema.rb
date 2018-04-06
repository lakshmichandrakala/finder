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

ActiveRecord::Schema.define(version: 20180406112850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "location_paths", force: :cascade do |t|
    t.uuid     "parent_id",  null: false
    t.uuid     "child_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_location_paths_on_child_id", using: :btree
    t.index ["parent_id", "child_id"], name: "idx_location_paths_parent_child", unique: true, using: :btree
    t.index ["parent_id"], name: "index_location_paths_on_parent_id", using: :btree
  end

  create_table "location_types", primary_key: "code", id: :string, force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", primary_key: "uuid", id: :uuid, default: nil, force: :cascade do |t|
    t.string   "code",               null: false
    t.string   "name",               null: false
    t.string   "location_type_code", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "location_paths", "locations", column: "child_id", primary_key: "uuid"
  add_foreign_key "location_paths", "locations", column: "parent_id", primary_key: "uuid"
end
