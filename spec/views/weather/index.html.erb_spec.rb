require 'rails_helper'

RSpec.describe "weather/index", type: :view do
  it 'shows the right content' do
    visit weather_index_path
    expect(page).to have_content('Weather forecast (Accuweather)')
    expect(page).to have_content('Historical Max Conditions (past 24 hours)')
  end

  describe 'click links on page' do
    it 'click links Historical Max Conditions (past 24 hours)' do
      visit weather_index_path
      click_link('Historical Max Conditions (past 24 hours')
      expect(page).to have_content('Historical Max Conditions (past 24 hours)')
      expect(page).to have_content('Moscow')
    end

    it 'click links Historical Min Conditions (past 24 hours)' do
      visit weather_index_path
      click_link('Historical Min Conditions (past 24 hours')
      expect(page).to have_content('Historical Min Conditions (past 24 hours)')
      expect(page).to have_content('Moscow')
    end

    it 'click links Historical AVG Conditions (past 24 hours)' do
      visit weather_index_path
      click_link('Historical AVG Conditions (past 24 hours')
      expect(page).to have_content('Historical AVG Conditions (past 24 hours)')
      expect(page).to have_content('Moscow')
    end

    it 'click links Current Conditions' do
      visit weather_index_path
      click_link('Current Conditions')
      expect(page).to have_content('Current Conditions')
      expect(page).to have_content('Moscow')
    end

    it 'click links Historical Current Conditions (past 24 hours)' do
      visit weather_index_path
      click_link('Historical Current Conditions (past 24 hours)')
      expect(page).to have_content('Historical Current Conditions (past 24 hours)')
      expect(page).to have_content('Moscow')
    end
  end
end
