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

ActiveRecord::Schema.define(version: 2024_09_04_190509) do

  create_table "building_custom_fields", force: :cascade do |t|
    t.integer "building_id"
    t.integer "custom_field_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_custom_fields_on_building_id"
    t.index ["custom_field_id"], name: "index_building_custom_fields_on_custom_field_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "address"
    t.string "state"
    t.string "zip"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address", "state", "zip"], name: "index_buildings_on_address_and_state_and_zip", unique: true
    t.index ["client_id"], name: "index_buildings_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.json "values", default: {}
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_custom_fields_on_client_id"
  end

end
