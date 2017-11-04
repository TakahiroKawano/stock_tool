json.extract! stock_earning, :id, :stock_id, :period, :next_kessan, :month_1q, :month_2q, :month_3q, :month_4q, :profit_1q, :profit_2q, :profit_3q, :profit_4q, :forecast_1q, :forecast_2q, :forecast_3q, :forecast_4q, :created_at, :updated_at
json.url stock_earning_url(stock_earning, format: :json)
