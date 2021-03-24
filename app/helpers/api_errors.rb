require 'sinatra/extension'

module ApiErrors
  extend Sinatra::Extension

  helpers do
    def error_response(error_messages)
      errors = ErrorSerializer.from_messages(error_messages)

      json errors
    end
  end
end
