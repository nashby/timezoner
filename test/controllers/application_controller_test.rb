require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test 'returns timezone' do
    timezone_polygon_1 = TimezonePolygon.create! do |timezone_polygon|
      timezone_polygon.name     = 'Europe/Minsk'
      timezone_polygon.geometry = wkt('POLYGON((20 20, 20 40, 40 40, 40 20, 20 20))')
    end

    get :timezone, { lat: 30, lng: 30 }

    assert_response :success
    assert_equal '{"timezone":"Europe/Minsk"}', @response.body
  end
end
