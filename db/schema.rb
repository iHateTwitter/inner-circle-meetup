# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_08_152346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avoidances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "reason"
    t.bigint "target_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["target_id"], name: "index_avoidances_on_target_id"
    t.index ["user_id"], name: "index_avoidances_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.bigint "host_id", null: false
    t.string "title"
    t.text "description"
    t.string "url"
    t.string "meetup_type"
    t.integer "participants_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["host_id"], name: "index_meetups_on_host_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "meetup_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meetup_id"], name: "index_participations_on_meetup_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "nickname"
    t.string "token"
    t.string "secret"
    t.string "image_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "avoidances", "users"
  add_foreign_key "avoidances", "users", column: "target_id"
  add_foreign_key "meetups", "users", column: "host_id"
  add_foreign_key "participations", "meetups"
  add_foreign_key "participations", "users"
end
