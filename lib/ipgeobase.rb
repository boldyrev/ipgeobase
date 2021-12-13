# frozen_string_literal: true

require "net/http"
require "happymapper"
require_relative "ipgeobase/version"


module Ipgeobase
  class Error < StandardError; end

  BASE_URL = 'http://ip-api.com/xml/'
  FIELDS = %w(country, countryCode, city, lat, lon)

  def self.lookup(ip)
    url = URI("#{BASE_URL}#{ip}?fields=#{FIELDS.join}")
    response = Net::HTTP.get(url)
    ip_info = Ip.parse(response)
  end

  private
    class Ip
      include HappyMapper

      tag 'query'
      element :country, String, tag: 'country'
      element :countrycode, String, tag: 'countryCode'
      element :city, String, tag: 'city'
      element :lat, Float, tag: 'lat'
      element :lon, Float, tag: 'lon'
    end
end

