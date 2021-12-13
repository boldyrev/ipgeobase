# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def setup
    stub_request(:get, /#{Ipgeobase::BASE_URL}/)
      .to_return(status: 200, body: xml_response)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_response_ok
    result = Ipgeobase.lookup("8.8.8.8")
    expected_lat = 39.03
    expected_lon = -77.5

    assert { result.country == "United States" }
    assert { result.countrycode == "US" }
    assert { result.city == "Ashburn" }
    assert { result.lat == expected_lat }
    assert { result.lon == expected_lon }
  end

  def xml_response
    <<-XML.strip
      <?xml version="1.0" encoding="UTF-8"?>
      <query>
        <country>United States</country>
        <countryCode>US</countryCode>
        <city>Ashburn</city>
        <lat>39.03</lat>
        <lon>-77.5</lon>
      </query>
    XML
  end
end
