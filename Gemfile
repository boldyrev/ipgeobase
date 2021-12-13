# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in ipgeobase.gemspec
gemspec

gem "rake", "~> 13.0"
gem "nokogiri-happymapper", require: "happymapper"

group :test do
  gem "minitest", "~> 5.0"
  gem "minitest-power_assert"
  gem "webmock"
end

group :development do
  gem "rubocop", "~> 1.21"
end
