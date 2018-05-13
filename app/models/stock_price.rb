class StockPrice < ApplicationRecord

  def self.get_stock_prices_from_web
    begin
      host = 'https://shikiho.jp'
      agent = Mechanize.new
      agent.user_agent_alias = 'Mac Safari'
      agent.get(host + '/tk/login') do |page|
        page.form_with(id: 'loginForm') do |form|
          form.field_with(name: 'i').value = 'magokoro1106@gmail.com'
          form.field_with(name: 'p').value = 'sincerity2'
        end.submit
      end

      stock_prices = Array.new
      Stock.all.each do |stock|
        doc = Nokogiri::HTML(agent.get(host + '/tk/stock/info/' + stock[:code].to_s).content)
        sleep 3
        contents = doc.xpath('//*[@id="push_1333"]/tr')

        stock_price = Hash.new
        stock_price[:stock_id] = stock[:id]
        stock_price[:transaction_date] = contents.css('.cls_t').inner_text.match(/\d{4}\/\d{2}\/\d{2}/)[0]
        stock_price[:opening] = contents.css('.opn_p').inner_text.gsub(/[\r\n\t, ]/,'')
        stock_price[:closing] = contents.css('.cls_p').inner_text.gsub(/[\r\n\t, ]/,'')
        stock_price[:high] = contents.css('.hig_p').inner_text.gsub(/[\r\n\t, ]/,'')
        stock_price[:low] = contents.css('.low_p').inner_text.gsub(/[\r\n\t, ]/,'')
        stock_price[:volume] = contents.css('.xv').inner_text.gsub(/[\r\n\t, ]/,'')
        stock_price[:trading] = contents.css('.tv').inner_text.gsub(/[\r\n\t, ]/,'').to_i * 1000000

        sihyo = contents.xpath('td[3]/div/table/tr')
        stock_price[:market_capitalization] = sihyo[0].css('/td')[0].inner_text.gsub(/[\r\n\t, ]/,'').to_i * 100000000
        stock_price[:per] = sihyo[1].css('/td')[0].inner_text.gsub(/[\r\n\t, ]/,'').match(/\d*\.?\d*/)[0]
        stock_price[:pbr] = sihyo[2].css('/td')[0].inner_text.gsub(/[\r\n\t, ]/,'')
        stock_price[:dividend_yield] = sihyo[3].css('/td')[0].inner_text.gsub(/[\r\n\t, ]/,'').match(/\d*\.?\d*/)[0]
        stock_price[:bps] = sihyo[5].css('/td')[0].inner_text.gsub(/[\r\n\t, ]/,'')

        stock_prices << stock_price
      end

      StockPrice.import stock_prices,
                          on_duplicate_key_update: [
                              :opening,
                              :closing,
                              :high,
                              :low,
                              :volume,
                              :trading,
                              :market_capitalization,
                              :per,
                              :pbr,
                              :dividend_yield,
                              :bps]
    rescue => e
      StockMailer.error_email(__method__, e).deliver_now
    end
  end

end
