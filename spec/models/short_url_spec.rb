
RSpec.describe ShortUrl, type: :model do
  it { is_expected.to respond_to :short_url }
  it { is_expected.to respond_to :original_url }

end
