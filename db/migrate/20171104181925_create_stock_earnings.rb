class CreateStockEarnings < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_earnings do |t|
      t.integer :stock_id, index: true, foreign_key: true
      t.string :period
      t.datetime :next_settlement
      t.integer :month_1q
      t.integer :month_2q
      t.integer :month_3q
      t.integer :month_4q
      t.integer :profit_1q
      t.integer :profit_2q
      t.integer :profit_3q
      t.integer :profit_4q
      t.integer :forecast_1q
      t.integer :forecast_2q
      t.integer :forecast_3q
      t.integer :forecast_4q

      t.timestamps
    end

    add_index :stock_earnings, [:stock_id, :period], unique: true
  end
end
