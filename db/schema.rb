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

ActiveRecord::Schema.define(version: 20160303074953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaves", force: :cascade do |t|
    t.string   "slack_user_id"
    t.integer  "leave_type"
    t.date     "leave_date"
    t.text     "reason"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "google_client_id"
    t.string   "google_client_secret"
    t.string   "slack_api_token"
    t.string   "google_calendar_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "settings", ["admin_id"], name: "index_settings_on_admin_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.integer  "setting_id"
    t.string   "refresh_token"
    t.string   "access_token"
    t.datetime "expires_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tokens", ["setting_id"], name: "index_tokens_on_setting_id", using: :btree

  add_foreign_key "settings", "admins"
  add_foreign_key "tokens", "settings"
end
