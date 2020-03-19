class Mc < ApplicationRecord
  require 'mastercard_currencyconversion'

  include MasterCard::Security::OAuth
  include MasterCard::Core
  include MasterCard::Core::Model
  include MasterCard::Core::Exceptions
  include MasterCard::API::CurrencyConversion

  def main
    consumerKey = "EFSrWArnQLR5J7XQ85AO7Kqt0KIbytH9R1Gt5W-n066b9f28!2627d9226b4e401ea54ce8ddacb3db4f0000000000000000"   # You should copy this from "My Keys" on your project page
    keyFile = "Rocketbank_Currency_Converter-sandbox.p12" # e.g. /Users/yourname/project/sandbox.p12 | C:\Users\yourname\project\sandbox.p12
    keyAlias = "keyalias"   # For production: change this to the key alias you chose when you created your production key
    keyPassword = "keystorepassword"   # For production: change this to the key alias you chose when you created your production key
    auth = OAuth::OAuthAuthentication.new(consumerKey, keyFile, keyAlias, keyPassword)
    Config.setAuthentication(auth)
    Config.setDebug(true) # Enable http wire logging
    # This is needed to change the environment to run the sample code. For production: use Config.setSandbox(false)
    Config.setEnvironment("sandbox_mtf");


    begin
      mapObj = RequestMap.new
      mapObj.set("fxDate", "2019-09-30")
      mapObj.set("transCurr", "ALL")
      mapObj.set("crdhldBillCurr", "DZD")
      mapObj.set("bankFee", "5")
      mapObj.set("transAmt", "23")
      response = ConversionRate.query(mapObj)

      out(response, "name"); #-->settlement-conversion-rate
      out(response, "description"); #-->Settlement conversion rate and billing amount
      out(response, "date"); #-->2017-11-03 03:59:50
      out(response, "data.conversionRate"); #-->0.57
      out(response, "data.crdhldBillAmt"); #-->13.11
      out(response, "data.fxDate"); #-->2019-09-30
      out(response, "data.transCurr"); #-->ALL
      out(response, "data.crdhldBillCurr"); #-->DZD
      out(response, "data.transAmt"); #-->23
      out(response, "data.bankFee"); #-->5

    rescue APIException => ex
      err("HttpCode: #{ex.getHttpCode()}")
      err("Message: #{ex.getMessage()}")
      err("ReasonCode: #{ex.getReasonCode()}")
      err("Message: #{ex.getSource()}")
    end

  end


  def out(response, key)
    puts "#key-->#{response.get(key)}"
  end

  def outObj(response, key)
    puts "#key-->#{response[key]}"
  end

  def err(message)
    puts message
  end

  def errObj(response, key)
    puts "#key-->#{response.get(key)}"
  end

end
