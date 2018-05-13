class CreateStockEarnings < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_earnings do |t|
      t.references :stock, foreign_key: true
      t.string :period
      t.integer :net_sale
      t.integer :operating_income
      t.integer :ordinary_income
      t.integer :net_income
      t.float :earnings_per_share
      t.string :dividends_per_share
      t.integer :created_at
      t.integer :updated_at

      t.timestamps
    end

    add_index :stock_earnings, [:stock_id, :period], unique: true
  end
end
