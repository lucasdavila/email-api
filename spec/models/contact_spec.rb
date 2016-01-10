RSpec.describe Contact, :type => :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:list_name) }

  it { is_expected.to_not allow_value('user@example,com').for(:email ) }
  it { is_expected.to_not allow_value('user_example.com').for(:email ) }
  it { is_expected.to allow_value('user@example.com').for(:email ) }

  describe 'before save' do
    it 'sets data with an empty array' do
      expect(subject.data).to be_nil
      subject.run_callbacks :save
      expect(subject.data).to eq({})
    end

    context 'when data is already set' do
      let(:data) { { 'foo' => 'bar' } }

      before do
        subject.data = data
      end

      it 'not changes' do
        subject.run_callbacks :save
        expect(subject.data).to eq data
      end
    end
  end
end
