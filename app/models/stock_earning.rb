class StockEarning < ApplicationRecord

  def self.get_stock_earnings_from_web
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

      stock_earnings = Array.new
      Stock.all.each do |stock|
        next if stock[:id] > 1000
        doc = Nokogiri::HTML(agent.get(host + '/tk/stock/info/' + stock[:code].to_s).content)
        sleep 3
        contents = doc.xpath('//*[@id="mainContents"]/div[5]/div[1]/table/tr/td[1]/div/table/tr[@class="text_right"]')

        contents.each do |content|
          stock_earning = Hash.new
          stock_earning[:stock_id] = stock[:id]
          stock_earning[:period] = content.css('/th').inner_text.gsub(/[\r\n\t ]/,'')
          stock_earning[:net_sale] = content.css('/td')[0].inner_text.gsub(/[\r\n\t, ]/,'')
          stock_earning[:operating_income] = content.css('/td')[1].inner_text.gsub(/[\r\n\t, ]/,'')
          stock_earning[:ordinary_income] = content.css('/td')[2].inner_text.gsub(/[\r\n\t, ]/,'')
          stock_earning[:net_income] = content.css('/td')[3].inner_text.gsub(/[\r\n\t, ]/,'')
          stock_earning[:earnings_per_share] = content.css('/td')[4].inner_text.gsub(/[\r\n\t ]/,'')
          stock_earning[:dividends_per_share] = content.css('/td')[5].inner_text.gsub(/[\r\n\t ]/,'')

          stock_earnings << stock_earning
        end
      end

      StockEarning.import stock_earnings,
                          on_duplicate_key_update: [
                              :net_sale,
                              :operating_income,
                              :ordinary_income,
                              :net_income,
                              :earnings_per_share,
                              :dividends_per_share]
    rescue => e
      StockMailer.error_email(__method__, e).deliver_now
    end
  end

end
