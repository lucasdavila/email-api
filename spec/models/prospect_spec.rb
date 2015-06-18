RSpec.describe Prospect, :type => :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:list_name) }
end
