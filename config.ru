require_relative 'config/environment'

use Rack::Ougai::LogRequests, Application.logger

map '/geocoder' do
  run GeocoderRoutes
end
