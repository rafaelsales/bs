require 'rails_helper'

RSpec.describe AlexaImporter, :vcr do
  describe "#persist_top_sites" do
    it "fetches Alexa top sites and stores in database" do
      expect do
        AlexaImporter.new.import_top_sites(5)
      end.to change { AlexaTopSite.count }.from(0).to(5)

      top_5 = AlexaTopSite.pluck('url, rank')

      expect(top_5).to match_array [
        ["google.com", 1],
        ["facebook.com", 2],
        ["youtube.com", 3],
        ["baidu.com", 4],
        ["yahoo.com", 5]
      ]
    end
  end
end
