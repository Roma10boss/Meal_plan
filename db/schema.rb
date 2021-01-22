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

ActiveRecord::Schema.define(version: 2021_01_07_065555) do

  create_table "meal_plans", force: :cascade do |t|
    t.string "goal"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meal_plans_on_user_id"
  end

  create_table "meal_schedules", force: :cascade do |t|
    t.string "eating_time"
    t.string "meal_type"
    t.integer "meal_id"
    t.integer "meal_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_id"], name: "index_meal_schedules_on_meal_id"
    t.index ["meal_plan_id"], name: "index_meal_schedules_on_meal_plan_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "food"
    t.datetime "day"
    t.integer "meal_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "beverage_ounces"
    t.string "side"
    t.string "vegetable"
    t.string "beverage"
    t.integer "drink"
    t.boolean "favorite", default: false
    t.index ["meal_plan_id"], name: "index_meals_on_meal_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_confirmation"
    t.string "uid"
  end

  add_foreign_key "meal_plans", "users"
  add_foreign_key "meal_schedules", "meal_plans"
  add_foreign_key "meal_schedules", "meals"
  add_foreign_key "meals", "meal_plans"
end
