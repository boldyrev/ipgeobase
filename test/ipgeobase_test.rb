# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def setup
    response = <<-XML.strip
      <?xml version="1.0" encoding="UTF-8"?>
      <query>
        <country>United States</country>
        <countryCode>US</countryCode>
        <city>Ashburn</city>
        <lat>39.03</lat>
        <lon>-77.5</lon>
      </query> 
    XML

    stub_request(:get, /#{Ipgeobase::BASE_URL}/)
      .to_return(status: 200, body: response)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_response_ok
    result = Ipgeobase::lookup('8.8.8.8')
    assert { result.country == 'United States' }
    assert { result.countrycode == 'US' }
    assert { result.city == 'Ashburn' }
    assert { result.lat == 39.03 }
    assert { result.lon == -77.5 }
  end
end

