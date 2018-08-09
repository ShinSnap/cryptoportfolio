class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    #Price date
    url = 'https://api.coinmarketcap.com/v2/ticker/?limit=5&sort=percent_change_24h'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @coins = JSON.parse(response)

    #News Data
    url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @news = JSON.parse(response)
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
