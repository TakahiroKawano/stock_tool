class CreateStockPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_prices do |t|
      t.references :stock, foreign_key: true
      t.datetime :transaction_date
      t.integer :opening
      t.integer :closing
      t.integer :high
      t.integer :low
      t.integer :volume
      t.integer :trading
      t.float :market_capitalization
      t.float :per
      t.float :pbr
      t.float :dividend_yield
      t.float :bps

      t.timestamps
    end

    add_index :stock_prices, [:stock_id, :transaction_date], unique: true
  end
end
