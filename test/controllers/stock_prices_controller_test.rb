require 'test_helper'

class StockPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_price = stock_prices(:one)
  end

  test "should get index" do
    get stock_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_price_url
    assert_response :success
  end

  test "should create stock_price" do
    assert_difference('StockPrice.count') do
      post stock_prices_url, params: { stock_price: { bps: @stock_price.bps, date: @stock_price.date, high: @stock_price.high, low: @stock_price.low, market_capitalization: @stock_price.market_capitalization, opening: @stock_price.opening, pbr: @stock_price.pbr, per: @stock_price.per, present: @stock_price.present, stock_id: @stock_price.stock_id, trading: @stock_price.trading, volume: @stock_price.volume } }
    end

    assert_redirected_to stock_price_url(StockPrice.last)
  end

  test "should show stock_price" do
    get stock_price_url(@stock_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_price_url(@stock_price)
    assert_response :success
  end

  test "should update stock_price" do
    patch stock_price_url(@stock_price), params: { stock_price: { bps: @stock_price.bps, date: @stock_price.date, high: @stock_price.high, low: @stock_price.low, market_capitalization: @stock_price.market_capitalization, opening: @stock_price.opening, pbr: @stock_price.pbr, per: @stock_price.per, present: @stock_price.present, stock_id: @stock_price.stock_id, trading: @stock_price.trading, volume: @stock_price.volume } }
    assert_redirected_to stock_price_url(@stock_price)
  end

  test "should destroy stock_price" do
    assert_difference('StockPrice.count', -1) do
      delete stock_price_url(@stock_price)
    end

    assert_redirected_to stock_prices_url
  end
end
