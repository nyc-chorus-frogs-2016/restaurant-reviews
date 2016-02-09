require 'rails_helper'

RSpec.feature 'visitor on topics list page' do
  context 'when not logged in' do
    scenario 'sees a list of topics' do
      r = FactoryGirl.create(:restaurant)
      visit root_path
      expect(page).to have_content('What!')
    end
  end
end