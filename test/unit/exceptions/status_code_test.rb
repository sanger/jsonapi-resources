require File.expand_path('../../../test_helper', __FILE__)
require 'jsonapi-resources'

class UnprocessableEntityStatusTest < ActiveSupport::TestCase
  def test_resolves_to_a_symbol_rack_recognizes
    assert Rack::Utils::SYMBOL_TO_STATUS_CODE.key?(JSONAPI::UNPROCESSABLE_ENTITY_STATUS),
           "JSONAPI::UNPROCESSABLE_ENTITY_STATUS (#{JSONAPI::UNPROCESSABLE_ENTITY_STATUS.inspect}) " \
           "should be a key in Rack::Utils::SYMBOL_TO_STATUS_CODE on the installed Rack (#{Rack.release})"
  end

  def test_resolves_to_http_422
    assert_equal 422, Rack::Utils::SYMBOL_TO_STATUS_CODE[JSONAPI::UNPROCESSABLE_ENTITY_STATUS]
  end

  def test_prefers_unprocessable_content_when_rack_supports_it
    if Rack::Utils::SYMBOL_TO_STATUS_CODE.key?(:unprocessable_content)
      assert_equal :unprocessable_content, JSONAPI::UNPROCESSABLE_ENTITY_STATUS
    else
      assert_equal :unprocessable_entity, JSONAPI::UNPROCESSABLE_ENTITY_STATUS
    end
  end
end
