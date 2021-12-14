# frozen_string_literal: true

# Класс описывает структуру ответа от сервиса
class Ip
  include HappyMapper

  tag "query"
  element :country, String, tag: "country"
  element :countrycode, String, tag: "countryCode"
  element :city, String, tag: "city"
  element :lat, Float, tag: "lat"
  element :lon, Float, tag: "lon"
end
