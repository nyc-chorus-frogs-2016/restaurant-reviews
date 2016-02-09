require 'rails_helper'

RSpec.feature 'visitor on topics list page' do
  context 'when not logged in' do
    scenario 'sees a list of topics' do
      r = FactoryGirl.create(:restaurant)
      visit root_path
      expect(page).to have_content('Restaurants')
      expect(page).to have_selector '[data-purpose="header"]'
      expect(page).to have_content(r.name)
      expect(page.current_path).to eq('/')
    end

    scenario 'can click a restaurant to see its details', js: true do
      # This test doesn't need to be js: true
      # but having it so lets you see the browser fire up
      r = FactoryGirl.create(:restaurant)
      visit root_path
      click_link(r.name)
      expect(page.current_path).to eq(restaurant_path(r))
    end
  end
end