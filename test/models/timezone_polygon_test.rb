require 'test_helper'

class TimezonePolygonTest < ActiveSupport::TestCase
  test 'returns the timezone at the given coordinates' do
    timezone_polygon_0 = TimezonePolygon.create! do |timezone_polygon|
      timezone_polygon.geometry = wkt('POLYGON((0 0, 0 10, 10 10, 10 0, 0 0))')
    end

    timezone_polygon_1 = TimezonePolygon.create! do |timezone_polygon|
      timezone_polygon.geometry = wkt('POLYGON((20 20, 20 40, 40 40, 40 20, 20 20))')
    end

    assert_equal timezone_polygon_1, TimezonePolygon.at(30, 30)
  end
end
