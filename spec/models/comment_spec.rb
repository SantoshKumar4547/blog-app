require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should validate presence of commenter' do
    comment = Comment.new
    comment.valid?
    expect(comment.errors.messages[:commenter]).to include "can't be blank"
  end

  it 'should validate presence of comment body' do
    comment = Comment.new
    comment.valid?
    expect(comment.errors.messages[:body]).to include "can't be blank"
  end

  it 'should save' do
  	user = User.create(email: 'user1@example.com', password: '123456', password_confirmation: '123456')
  	post = Post.create(title: "title", text:"New Post", user: user)
  	comment = Comment.new(commenter: "Testing Group", body: "Good post", post: post)
    expect(comment.save).to eq(true)
  end

end
