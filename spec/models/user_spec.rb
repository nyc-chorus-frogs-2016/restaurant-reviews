require 'rails_helper'

RSpec.describe User do

  it 'responds to email' do
    u = User.new
    expect(u).to respond_to(:email)
  end
  
  it 'converts email to lower case on save' do
    u = User.new(email: 'STEVEN@example.com', username:'steven', password:'abcdefg')
    u.save
    expect(u.email).to eq('steven@example.com')
  end

end