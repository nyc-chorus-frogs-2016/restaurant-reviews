require 'rails_helper' 
RSpec.describe RestaurantsController do
  
  before(:each) do
    u = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(u)
  end

  describe '#show' do
    it 'renders the show template' do
      r = FactoryGirl.create(:restaurant)
      get :show, id: r.id
      expect(response).to render_template(:show)
    end
  end

  describe '#create' do
    it 'should redirect on restaurant creation ' do
      params = { restaurant: FactoryGirl.attributes_for(:restaurant) }
      post :create, params
      expect(response).to redirect_to restaurant_path(Restaurant.last)
    end
  end
end