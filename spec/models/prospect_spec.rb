RSpec.describe Prospect, :type => :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:list_name) }

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
