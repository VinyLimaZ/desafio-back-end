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

ActiveRecord::Schema.define(version: 2019_05_17_174651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cnabs", force: :cascade do |t|
    t.text "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "owner_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "kind"
    t.datetime "date_time"
    t.integer "value"
    t.string "document"
    t.string "card"
    t.bigint "store_id"
    t.bigint "cnab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnab_id"], name: "index_transactions_on_cnab_id"
    t.index ["store_id"], name: "index_transactions_on_store_id"
  end

  add_foreign_key "transactions", "cnabs"
  add_foreign_key "transactions", "stores"
end
