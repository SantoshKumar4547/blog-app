require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should validate presence of title' do
    post = Post.new
    post.valid?
    expect(post.errors.messages[:title]).to include "can't be blank"
  end

  it 'should validate of title length' do
    post = Post.new(title: "tle")
    post.valid?
    expect(post.errors.messages[:title]).to include "is too short (minimum is 5 characters)"
  end

  it "shoud save the post" do
  	user = User.create(email: 'user1@example.com', password: '123456', password_confirmation: '123456')
  	post = Post.new(title: "title", text:"New Post", user: user)
  	expect(post.save).to eq(true)
  end
end
