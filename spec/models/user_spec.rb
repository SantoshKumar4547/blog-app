require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should return username' do
  	user = User.create(email: 'user1@example.com', password: '123456', password_confirmation: '123456')
  	expect(user.username).to eq('User1')
  end

  it "should update image" do
	  file = File.new(Rails.root.join("spec/userImage.jpg"))
	  user = User.new(email: "user1@example.com", password: "123456", password_confirmation: "123456", avatar: file)
	  expect(user.save).to eq(true)
	end

end
