class StockEarningsController < ApplicationController
  before_action :set_stock_earning, only: [:show, :edit, :update, :destroy]

  # GET /stock_earnings
  # GET /stock_earnings.json
  def index
    @stock_earnings = StockEarning.all
  end

  # GET /stock_earnings/1
  # GET /stock_earnings/1.json
  def show
  end

  # GET /stock_earnings/new
  def new
    @stock_earning = StockEarning.new
  end

  # GET /stock_earnings/1/edit
  def edit
  end

  # POST /stock_earnings
  # POST /stock_earnings.json
  def create
    @stock_earning = StockEarning.new(stock_earning_params)

    respond_to do |format|
      if @stock_earning.save
        format.html { redirect_to @stock_earning, notice: 'Stock earning was successfully created.' }
        format.json { render :show, status: :created, location: @stock_earning }
      else
        format.html { render :new }
        format.json { render json: @stock_earning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_earnings/1
  # PATCH/PUT /stock_earnings/1.json
  def update
    respond_to do |format|
      if @stock_earning.update(stock_earning_params)
        format.html { redirect_to @stock_earning, notice: 'Stock earning was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_earning }
      else
        format.html { render :edit }
        format.json { render json: @stock_earning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_earnings/1
  # DELETE /stock_earnings/1.json
  def destroy
    @stock_earning.destroy
    respond_to do |format|
      format.html { redirect_to stock_earnings_url, notice: 'Stock earning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_earning
      @stock_earning = StockEarning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_earning_params
      params.require(:stock_earning).permit(:stock_id, :period, :next_kessan, :month_1q, :month_2q, :month_3q, :month_4q, :profit_1q, :profit_2q, :profit_3q, :profit_4q, :forecast_1q, :forecast_2q, :forecast_3q, :forecast_4q)
    end
end
