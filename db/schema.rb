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

ActiveRecord::Schema.define(version: 2021_09_13_171854) do

  create_table "hiringchecks", force: :cascade do |t|
    t.boolean "manager?"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "restaurant_id_id"
    t.string "name"
    t.string "type"
    t.integer "pay"
    t.text "description"
    t.date "desired_start_date"
    t.index ["restaurant_id_id"], name: "index_jobs_on_restaurant_id_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer "user_id_id"
    t.string "name"
    t.string "borough_location"
    t.text "price_range"
    t.text "picture"
    t.text "type"
    t.index ["user_id_id"], name: "index_restaurants_on_user_id_id"
  end

  create_table "userjobs", force: :cascade do |t|
    t.integer "user_id_id"
    t.integer "job_id_id"
    t.index ["job_id_id"], name: "index_userjobs_on_job_id_id"
    t.index ["user_id_id"], name: "index_userjobs_on_user_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "hiringcheck_id_id"
    t.string "full_name"
    t.integer "phone_number"
    t.text "email"
    t.text "description"
    t.text "profile_pic"
    t.text "linkedin_link"
    t.index ["hiringcheck_id_id"], name: "index_users_on_hiringcheck_id_id"
  end

  add_foreign_key "jobs", "restaurant_ids"
  add_foreign_key "restaurants", "user_ids"
  add_foreign_key "userjobs", "job_ids"
  add_foreign_key "userjobs", "user_ids"
  add_foreign_key "users", "hiringcheck_ids"
end
