class Stock < ApplicationRecord
  require 'open-uri'

  def self.get_stocks_from_web
    host = 'https://m.finance.yahoo.co.jp/'
    begin
      (13..99).each do |i|
        doc = Nokogiri::HTML(open(host + '/search?q=' + i.to_s + '&type=c'))
        sleep 3
        result_codes = doc.xpath('//*[@id="results"]/li')
        if result_codes.blank?
          raise '証券情報取得失敗'
        end

        stocks = Array.new
        result_codes.each do |result_code|
          stock = Hash.new
          stock[:name] = result_code.css('.title').inner_text
          stock[:code] = result_code.css('.subText').inner_text.match(/\w{4}/)[0]
          stock[:market] = result_code.css('.subText').inner_text.match(/（(.+)）/)[1]

          stocks << stock
        end

        Stock.import stocks
      end
    rescue => e
      StockMailer.error_email(__method__, e).deliver_now
    end
  end

end
