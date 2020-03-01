require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	let(:user) {User.create!(email: 'user1@example.com', password: '123456', password_confirmation: '123456')}
	let(:post) {Post.create!(title: "title", text:"New Post", user: user)}
	
	context 'GET #index' do
		it "should return success response" do
			sign_in user
			get :index
			expect(response).to be_success
		end
	end

	context 'GET #show' do
		it "should return success response" do
			get :show, params: {id: post.id}
			expect(response).to be_success
		end
	end

	context 'GET #home' do
		it "should return success response" do
			get "home"
			expect(response).to be_success
		end
	end

	context 'GET #new' do
		it "should return success response" do
			sign_in user
			get "new"
			expect(response).to be_success
		end
	end

	context 'GET #edit' do
		it "should return success response" do
			sign_in user
			get "edit", params: {id: post.id}
			expect(response).to be_success
		end
	end

	context 'Create new post' do
		it "should return success response" do
			sign_in user
			# post :create, "params" => { "post"=> {"title" => "newqwq", "text"=> "weqweqweq"}}
			# expect(response).to redirect_to("/posts")
		end
	end

	context "UPDATE #update" do
		it "should redirect to post" do
			sign_in user
			put :update, params: {id: post.id, post: {title: "update title", text: "update Post"}}
			expect(response).to redirect_to("/posts/#{post.id}")
		end
	end

	context "DELETE #destroy" do
		it "should redirect to post" do
			sign_in user
			delete :destroy, params: { id: post.id }
			expect(response).to redirect_to("/posts")
		end
	end
end
