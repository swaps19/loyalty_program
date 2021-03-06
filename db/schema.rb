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

ActiveRecord::Schema[7.0].define(version: 2022_05_27_204056) do
  create_table "loyalty_points", force: :cascade do |t|
    t.integer "points"
    t.datetime "expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "transaction_id"
    t.index ["transaction_id"], name: "index_loyalty_points_on_transaction_id"
    t.index ["user_id"], name: "index_loyalty_points_on_user_id"
  end

  create_table "loyalty_rewards", force: :cascade do |t|
    t.string "reward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "summery", default: 0
  end

  create_table "loyalty_rewards_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "loyalty_reward_id", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "tier", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "loyalty_points", "transactions"
  add_foreign_key "loyalty_points", "users"
  add_foreign_key "transactions", "users"
end
