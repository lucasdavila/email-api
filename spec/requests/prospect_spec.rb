RSpec.describe ProspectController, :type => :request do
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
      let(:params) { { email: nil } }
      let(:expected_errors) { { 'email' => ["can't be blank"] } }

      it 'returns the errors messages' do
        post '/', params

        expect(last_response.status).to eq 400
        expect(response_data['errors']).to include expected_errors
      end
    end

    context 'email' do
      before do
        Mail::TestMailer.deliveries.clear
      end

      let(:from) { 'test@foo.com' }

      it 'sends an email to the prospect' do
        post '/', params

        is_expected.to have_sent_email.to params[:email]
        is_expected.to have_sent_email.from from

        is_expected.to have_sent_email.matching_subject(Regexp.new 'Here is your content')
        is_expected.to have_sent_email.matching_body(
          Regexp.new "Hello #{params[:email]}.\nTo download the context click here."
        )
      end

      context 'when there is no template to the list' do
        before do
          File.delete to_fixture_path
        end

        after do
          FileUtils.copy from_fixture_path, to_fixture_path
        end

        let(:expected_errors) { { 'list_name' => ['there is no template for this list'] } }

        it 'returns an error' do
          post '/', params

          expect(last_response.status).to eq 400
          expect(response_data['errors']).to include expected_errors
        end
      end
    end
  end
end
