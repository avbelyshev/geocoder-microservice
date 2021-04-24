require_relative 'config/environment'

use Rack::Deflater
use Prometheus::Middleware::Exporter
use Rack::Ougai::LogRequests, Application.logger

map '/geocoder' do
  run GeocoderRoutes
end
