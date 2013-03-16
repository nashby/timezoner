ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  def wkt(value)
    TimezonePolygon::GEOFACTORY.project TimezonePolygon::GEOFACTORY.parse_wkt(value)
  end

  ActiveRecord::Migration.check_pending!
end
