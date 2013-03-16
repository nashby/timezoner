class TimezonePolygon < ActiveRecord::Base
  GEOFACTORY = RGeo::Geographic.simple_mercator_factory
  set_rgeo_factory_for_column(:geometry, GEOFACTORY.projection_factory)

  def self.at(lat, lng)
    coords = self::GEOFACTORY.project self::GEOFACTORY.point(lng, lat)

    self.where('ST_Contains(geometry, ?)', coords).first
  end
end
