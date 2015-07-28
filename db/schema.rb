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

ActiveRecord::Schema.define(version: 20150410181933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.integer "total_due"
    t.integer "user_id"
    t.string  "bank_website"
    t.integer "vendor_id"
  end

  create_table "events", force: :cascade do |t|
    t.string  "location"
    t.time    "start_time"
    t.text    "notes"
    t.integer "wedding_id"
    t.integer "vendor_id"
    t.date    "date"
    t.string  "name"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "budget_id"
    t.integer "amount"
    t.date    "due_date"
    t.boolean "paid",      default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "contact_person"
    t.string   "contact_email"
    t.text     "additional_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "weddings", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

end
