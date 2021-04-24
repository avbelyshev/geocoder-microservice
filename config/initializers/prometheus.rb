require 'prometheus/client'
require 'prometheus/middleware/exporter'

Metrics.configure do |registry|
  registry.counter(
    :geocoding_requests_total,
    docstring: 'The total number of geocoding requests.',
    labels: %i[result]
  )

  registry.histogram(
    :geocoding_duration,
    docstring: "geocoding duration",
    labels: %i[city]
  )
end
