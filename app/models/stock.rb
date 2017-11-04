class Stock < ApplicationRecord
  require 'open-uri'
  require 'csv'

  ### logic ###
  def self.get_stocks_from_web
    url = 'http://k-db.com'
    path = './tmp/stocks_csv/'
    doc = Nokogiri::HTML(open(url + '/stocks'))
    link_file = doc.xpath('//*[@id="downloadlink"]/a')[0].attribute('href').value
    open(path + 'stocks.csv', 'wb') do |output|
      open(url + link_file) do |data|
        output.write(data.read)
      end
    end

    stocks_csv_file = Dir::entries(path).find{|f| f.match(/^stocks\.csv$/)}
    stocks_csv = CSV.read(path + stocks_csv_file)

    stocks_csv.each_with_index do |row, i|
      # skip header
      if i == 0 or  i == 1
        next
      end

      stocks = Hash.new
      stocks[:code] = row[0][0,4]
      stocks[:name] = row[1]
      # stocks[:category] = ''
      stocks[:market] = row[2]

      @stock = Stock.new(stocks)
      if @stock.save
        # create
      else
        # update
        @stock = @stock.find_by(code: stocks[:code])
        if @stock.update(stocks)
          # success
        else
          # fail
        end
      end
    end
  end

end
