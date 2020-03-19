class RatesController < ApplicationController
  def index
    require 'open-uri'
    @doc = Nokogiri::HTML(open('https://rocketbank.ru/rates'))
  end

  def rocket
    #table = doc.css('bRBSYN')
    #usd = table.css("_3OuFTm bjWHK8 eFlsPl")
    #buy_usd = doc.css('_3OuFTm bjWHK8 eFlsPl')
    #eur = doc.css('_3OuFTm bjWHK8 eFlsPl')
    #buy_eur = doc.css('_3OuFTm bjWHK8 eFlsPl')

  end
end
