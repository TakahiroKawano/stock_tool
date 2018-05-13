json.extract! stock_price, :id, :stock_id, :date, :present, :opening, :high, :low, :volume, :trading, :market_capitalization, :per, :pbr, :bps, :created_at, :updated_at
json.url stock_price_url(stock_price, format: :json)
