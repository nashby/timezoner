class CreateTimezonePolygons < ActiveRecord::Migration
  def change
    create_table :timezone_polygons do |t|
      t.string :name
      t.geometry :geometry, srid: 3785
    end

    add_index :timezone_polygons, :geometry, spatial: true
  end
end
