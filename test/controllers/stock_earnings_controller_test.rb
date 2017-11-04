require 'test_helper'

class StockEarningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_earning = stock_earnings(:one)
  end

  test "should get index" do
    get stock_earnings_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_earning_url
    assert_response :success
  end

  test "should create stock_earning" do
    assert_difference('StockEarning.count') do
      post stock_earnings_url, params: { stock_earning: { forecast_1q: @stock_earning.forecast_1q, forecast_2q: @stock_earning.forecast_2q, forecast_3q: @stock_earning.forecast_3q, forecast_4q: @stock_earning.forecast_4q, month_1q: @stock_earning.month_1q, month_2q: @stock_earning.month_2q, month_3q: @stock_earning.month_3q, month_4q: @stock_earning.month_4q, next_kessan: @stock_earning.next_kessan, period: @stock_earning.period, profit_1q: @stock_earning.profit_1q, profit_2q: @stock_earning.profit_2q, profit_3q: @stock_earning.profit_3q, profit_4q: @stock_earning.profit_4q, stock_id: @stock_earning.stock_id } }
    end

    assert_redirected_to stock_earning_url(StockEarning.last)
  end

  test "should show stock_earning" do
    get stock_earning_url(@stock_earning)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_earning_url(@stock_earning)
    assert_response :success
  end

  test "should update stock_earning" do
    patch stock_earning_url(@stock_earning), params: { stock_earning: { forecast_1q: @stock_earning.forecast_1q, forecast_2q: @stock_earning.forecast_2q, forecast_3q: @stock_earning.forecast_3q, forecast_4q: @stock_earning.forecast_4q, month_1q: @stock_earning.month_1q, month_2q: @stock_earning.month_2q, month_3q: @stock_earning.month_3q, month_4q: @stock_earning.month_4q, next_kessan: @stock_earning.next_kessan, period: @stock_earning.period, profit_1q: @stock_earning.profit_1q, profit_2q: @stock_earning.profit_2q, profit_3q: @stock_earning.profit_3q, profit_4q: @stock_earning.profit_4q, stock_id: @stock_earning.stock_id } }
    assert_redirected_to stock_earning_url(@stock_earning)
  end

  test "should destroy stock_earning" do
    assert_difference('StockEarning.count', -1) do
      delete stock_earning_url(@stock_earning)
    end

    assert_redirected_to stock_earnings_url
  end
end
