class ApplicationController < ActionController::API
  def timezone
    timezone_polygon = TimezonePolygon.at(params[:lat], params[:lng])

    render json: { timezone: timezone_polygon && timezone_polygon.name }
  end
end
