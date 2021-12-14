# frozen_string_literal: true

require "net/http"
require "happymapper"
require_relative "ipgeobase/version"
require_relative "ipgeobase/ip"

# Ipgeobase module
module Ipgeobase
  class Error < StandardError; end

  BASE_URL = "http://ip-api.com/xml/"
  FIELDS = %w[country countryCode city lat lon].join(",")

  def self.lookup(ip)
    url = Addressable::Template.new(
      "#{BASE_URL}{ip}?fields={fields}"
    ).expand(
      {
        "ip" => ip,
        "fields" => FIELDS
      }
    )
    response = Net::HTTP.get(url)
    Ip.parse(response)
  end
end
