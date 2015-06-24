require 'rails_helper'

RSpec.describe AlexaTopSite do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:rank) }
    it { is_expected.to validate_presence_of(:url) }
  end
end
