class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    url = 'https://api.coinmarketcap.com/v2/ticker/'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @coins = JSON.parse(response)

    @my_coins = [ "BTC", "XRP", "ETC", "XLM", "NEO", "WAX", "STEEM" ]
  end

  def lookup
    require 'net/http'
    require 'json'

    url = 'https://api.coinmarketcap.com/v2/ticker/'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @lookup_coin = JSON.parse(response)

    @symbol = params[:sym]

    if @symbol
      @symbol = @symbol.upcase
    end

    if @symbol == ''
      @symbol = "You forgot to enter a currency"
    end
  end

  def aboutus
  end
end
