RSpec.describe GeocoderRoutes, type: :routes do
  describe 'POST /' do
    context 'existing city' do
      it 'returns coordinates' do
        post '/', city: 'City 17'

        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("[45.05,90.05]")
      end
    end

    context 'missing city' do
      it 'returns a nil value' do
        post '/', city: 'Missing'

        expect(last_response.status).to eq(204)
        expect(last_response.body).to be_blank
      end
    end

    context 'missing parameters' do
      it 'returns an error' do
        post '/'

        expect(last_response.status).to eq(422)
      end
    end
  end
end
