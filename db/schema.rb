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

ActiveRecord::Schema.define(version: 20171104181925) do

  create_table "stock_earnings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stock_id"
    t.string "period"
    t.datetime "next_settlement"
    t.integer "month_1q"
    t.integer "month_2q"
    t.integer "month_3q"
    t.integer "month_4q"
    t.integer "profit_1q"
    t.integer "profit_2q"
    t.integer "profit_3q"
    t.integer "profit_4q"
    t.integer "forecast_1q"
    t.integer "forecast_2q"
    t.integer "forecast_3q"
    t.integer "forecast_4q"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id", "period"], name: "index_stock_earnings_on_stock_id_and_period", unique: true
    t.index ["stock_id"], name: "index_stock_earnings_on_stock_id"
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "name"
    t.string "category"
    t.string "market"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_stocks_on_code"
  end

end
