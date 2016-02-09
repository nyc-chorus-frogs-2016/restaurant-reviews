require 'rails_helper'

RSpec.describe Restaurant do
  it 'can load restaurants by average rating descending' do
    review1 = FactoryGirl.create(:review, rating: 2)
    review2 = FactoryGirl.create(:review, rating: 5)
    rest_list = Restaurant.by_average_rating
    expect(rest_list).to eq([review2.restaurant, review1.restaurant])
  end
end
