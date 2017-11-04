class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :code
      t.string :name
      t.string :category
      t.string :market

      t.timestamps
    end
  end
end
