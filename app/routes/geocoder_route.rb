class GeocoderRoutes < Application
  post '/' do
    input_params = validate_with!(InputParamsContract)

    coordinates = Geocoder.geocode(input_params['city'])

    if coordinates.blank?
      geocoding_result = 'failure'
      status 204
      result = {}.to_json
    else
      geocoding_result = 'success'
      status 200
      result = coordinates.to_json
    end

    Metrics.geocoding_requests_total.increment(labels: { result: geocoding_result })

    result
  end
end
