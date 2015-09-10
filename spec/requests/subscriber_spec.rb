RSpec.describe SubscriberController, :type => :request do
  let(:model_name) { :prospect }

  describe 'post request' do
    before do
      FileUtils.copy from_fixture_path, to_fixture_path
    end

    after do
      File.delete to_fixture_path
    end

    let(:from_fixture_path) { "spec/fixtures/template.yml" }
    let(:to_fixture_path) { "lib/templates/#{params[:list_name]}.yml" }
    let(:params) { { email: 'foo@bar.com', list_name: 'foo-content-download' } }

    it 'creates the model_instance' do
      expect { post '/', params }.to change(model_class, :count).by(1)

      expect(last_response.status).to eq 201

      # make sure the sent params are in the response
      expect(response_data).to include params.stringify_keys

      # make sure the model attribyres or serializer return are in the response
      expect(last_response.body).to include last_model_instance_to_json
    end

    context 'when there is a validation error' do
      let(:params) { { email: nil, list_name: 'foo' } }
      let(:expected_errors) { { 'email' => ["can't be blank", "is invalid"] } }

      it 'returns the errors messages' do
        post '/', params

        expect(last_response.status).to eq 400
        expect(response_data['errors']).to include expected_errors
      end
    end

    context 'when do not send the list name' do
      let(:expected_errors) { { 'list_name' => ['The list_name param is required'] } }
      let(:params) { { email: 'foo@foo.com' } }

      it 'returns an error' do
        post '/', params

        expect(last_response.status).to eq 400
        expect(response_data['errors']).to include expected_errors
      end
    end
  end
end
