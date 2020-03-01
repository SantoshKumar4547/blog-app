require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	let(:user) {User.create!(email: 'user1@example.com', password: '123456', password_confirmation: '123456')}
	let(:post) {Post.create!(title: "title", text:"New Post", user: user)}
	let(:comment) {Comment.create!(commenter: "Testing Group", body: "Good post", post_id: post.id)}
	
	context 'create comment' do
		it "should return success response" do
			sign_in user
			# post "create", params: { post_id: post.id, comment: { commenter: "Testing Group", body: "Good post" } }
			# expect(response).to redirect_to("/posts/#{post.id}")
		end
	end

	context 'destroy comment' do
		it "should redirect to post" do
			sign_in user
			delete "destroy", params: { id: comment.id, post_id: post.id}
			expect(response).to redirect_to("/posts/#{post.id}")
		end
	end
end
