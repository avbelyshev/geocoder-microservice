class GeocoderRoutes < Application
  post '/' do
    input_params = validate_with!(InputParamsContract)

    coordinates = Geocoder.geocode(input_params['city'])

    if coordinates.blank?
      status 204
      {}.to_json
    else
      status 200
      coordinates.to_json
    end
  end
end
