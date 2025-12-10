# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_12_10_195822) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "diagnoses", force: :cascade do |t|
    t.integer "cost_stimate"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "resolution"
    t.datetime "updated_at", null: false
    t.bigint "visit_id", null: false
    t.index ["visit_id"], name: "index_diagnoses_on_visit_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "severity"
    t.string "type"
    t.datetime "updated_at", null: false
    t.bigint "visit_id", null: false
    t.index ["visit_id"], name: "index_inspections_on_visit_id"
  end

  create_table "owners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "document"
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.integer "km"
    t.integer "model"
    t.bigint "owner_id", null: false
    t.string "plate"
    t.datetime "updated_at", null: false
    t.string "version"
    t.integer "year"
    t.index ["owner_id"], name: "index_vehicles_on_owner_id"
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "km"
    t.text "notes"
    t.datetime "occurred_at"
    t.bigint "owner_id", null: false
    t.text "reason"
    t.string "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "vehicle_id", null: false
    t.index ["owner_id"], name: "index_visits_on_owner_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["vehicle_id"], name: "index_visits_on_vehicle_id"
  end

  add_foreign_key "diagnoses", "visits"
  add_foreign_key "inspections", "visits"
  add_foreign_key "sessions", "users"
  add_foreign_key "vehicles", "owners"
  add_foreign_key "visits", "owners"
  add_foreign_key "visits", "users"
  add_foreign_key "visits", "vehicles"
end
