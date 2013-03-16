namespace :timezones do
  desc 'Import timezones from the specified shapefile'
  task :import => :environment do
    require 'rgeo/shapefile'

    RGeo::Shapefile::Reader.open(ENV['SHAPEFILE'], factory: TimezonePolygon::GEOFACTORY) do |file|
      file.each do |record|
        TimezonePolygon.create! do |timezone_polygon|
          timezone_polygon.geometry = TimezonePolygon::GEOFACTORY.project(record.geometry)
          timezone_polygon.name     = record.attributes['TZID']
        end
      end
    end
  end
end
