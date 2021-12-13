# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "bundler/setup"
Bundler.require

require "ipgeobase"
require "webmock/minitest"

require "minitest/autorun"
