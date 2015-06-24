require 'rails_helper'

RSpec.describe 'Alexa Top Sites management' do
  fixtures :alexa_top_sites

  scenario 'when I visit index page then I should see the top sites table' do
    visit alexa_top_sites_path

    within '.table tr:nth-child(1)' do
      expect(page).to have_text '1'
      expect(page).to have_text 'google.com'
    end

    within '.table tr:nth-child(10)' do
      expect(page).to have_text '10'
      expect(page).to have_text 'twitter.com'
    end
  end
end
