require 'rails_helper'

RSpec.describe 'Alexa Top Sites management' do
  fixtures :alexa_top_sites

  scenario 'when I visit index page then I should see the top sites table' do
    visit alexa_top_sites_path

    within '#alexa-top-sites tbody tr:nth-child(1)' do
      expect(page).to have_text '1'
      expect(page).to have_text 'google.com'
    end

    within '#alexa-top-sites tbody tr:nth-child(10)' do
      expect(page).to have_text '10'
      expect(page).to have_text 'twitter.com'
    end
  end

  scenario 'when I click on edit link of a top site I should be able to save it', js: true do
    visit alexa_top_sites_path

    within '#alexa-top-sites tbody tr:nth-child(1)' do
      expect(page).to have_text 'google.com'
      click_link 'Edit'
      wait_for_ajax
    end

    within '#alexa-top-site-modal form' do
      fill_in 'Url', with: 'the-new-google.com'
      click_button 'Save'
      wait_for_ajax
    end

    visit alexa_top_sites_path

    within '#alexa-top-sites tbody tr:nth-child(1)' do
      expect(page).to have_text 'the-new-google.com'
    end
  end
end
