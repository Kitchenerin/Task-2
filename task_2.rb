require 'rubygems'
require 'mechanize'

class ExchangeUSD

  attr_reader :usd, :path
  attr_writer :usd, :path

  def initialize
    @a = Mechanize.new
    @path = 'span.exchange-rate-table__index.ng-binding.ng-scope.exchange-rate-table__index_up #text .wholeText .textContent .nodeValue tr td div'
  end
  def parser
    page = @a.get('https://www.vtb.ru/personal/platezhi-i-perevody/obmen-valjuty/')
    review_meta = page.search(@path)
    @usd.to_f*review_meta.search('').text.to_f
  end
end
exchange = ExchangeUSD.new
exchange.usd = gets
puts exchange.parser