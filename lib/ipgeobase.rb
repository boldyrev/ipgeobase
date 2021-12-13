# frozen_string_literal: true

require "net/http"
require "happymapper"
require_relative "ipgeobase/version"

# Ipgeobase module
module Ipgeobase
  class Error < StandardError; end

  BASE_URL = "http://ip-api.com/xml/"

  def self.lookup(ip)
    fields = %w[country countryCode city lat lon]
    url = URI("#{BASE_URL}#{ip}?fields=#{fields.join}")
    response = Net::HTTP.get(url)
    Ip.parse(response)
  end

  class Ip
    include HappyMapper

    tag "query"
    element :country, String, tag: "country"
    element :countrycode, String, tag: "countryCode"
    element :city, String, tag: "city"
    element :lat, Float, tag: "lat"
    element :lon, Float, tag: "lon"
  end
end
