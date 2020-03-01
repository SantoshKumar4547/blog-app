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

	context 'POST #create' do
		it "should return success response" do
			sign_in user
			post :create, post: { title: "new title", text: "New Post" }
			expect(response).to be_success
		end
	end

	context "UPDATE #update" do
		it "should return success response" do
			sign_in user
			put "destroy", params: {id: post.id, title: "update title", text: "update Post" }
		end
	end

	context "DELETE #destroy" do
		it "should return success response" do
			sign_in user
			delete "destroy", params: {id: post.id}
		end
	end
end
