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

ActiveRecord::Schema.define(version: 20180503091954) do

  create_table "stock_earnings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "stock_id"
    t.string "period"
    t.integer "net_sale"
    t.integer "operating_income"
    t.integer "ordinary_income"
    t.integer "net_income"
    t.float "earnings_per_share", limit: 24
    t.string "dividends_per_share"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id", "period"], name: "index_stock_earnings_on_stock_id_and_period", unique: true
    t.index ["stock_id"], name: "index_stock_earnings_on_stock_id"
  end

  create_table "stock_prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "stock_id"
    t.datetime "transaction_date"
    t.integer "opening"
    t.integer "closing"
    t.integer "high"
    t.integer "low"
    t.integer "volume"
    t.integer "trading"
    t.float "market_capitalization", limit: 24
    t.float "per", limit: 24
    t.float "pbr", limit: 24
    t.float "dividend_yield", limit: 24
    t.float "bps", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id", "transaction_date"], name: "index_stock_prices_on_stock_id_and_transaction_date", unique: true
    t.index ["stock_id"], name: "index_stock_prices_on_stock_id"
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

  add_foreign_key "stock_earnings", "stocks"
  add_foreign_key "stock_prices", "stocks"
end
