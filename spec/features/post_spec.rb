require 'rails_helper'

describe 'navigate' do

	before do
		@user = FactoryGirl.create(:user)
		login_as(@user, scope: :user)
	end

	describe 'index' do
		before do
			visit posts_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it "has a title of Posts" do
			expect(page).to have_content(/Posts/) 
		end

		it "has a list of posts" do 
			post1 = FactoryGirl.build_stubbed(:post)
			post2 = FactoryGirl.build_stubbed(:second_post)
			visit posts_path

			expect(page).to have_content(/Rationale|content/)
		end

		it "only shows the posts of the current user" do
			post1 = FactoryGirl.create(:post)
			post1.update(user_id: @user.id)
			post2 = FactoryGirl.create(:second_post)
			post2.update(user_id: @user.id)

			post_from_other_user = FactoryGirl.create(:post_from_other_user)
			visit posts_path

			expect(page).to_not have_content(/Post from another user/)
		end
	end

	describe 'new' do
		it 'has a link from the homepage' do
			visit root_path
			click_link('new_post')

			expect(page.status_code).to eq(200)
		end
	end

	describe 'creation' do
		before do 
			visit new_post_path
		end

		it "has a new form that can be reached" do 
			expect(page.status_code).to eq(200)
		end

		it "can be created from new form page" do 
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Some rationale"
			fill_in 'post[overtime_request]', with: 3.2
			
			expect { click_on "Save" }.to change(Post, :count).by(1)
		end

		it "has a user associated with it" do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "User Association"
			fill_in 'post[overtime_request]', with: 3.2
			click_on "Save"
			
			expect(@user.posts.last.rationale).to eq("User Association")
		end
	end

	describe 'edit' do
		before do
			@post = FactoryGirl.create(:post)
			@post.user_id = @user.id
			@post.save
		end

		it "can be edited" do
			visit edit_post_path(@post)
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Edited rationale"
			click_on "Save"
			
			expect(page).to have_content("Edited rationale")
		end

		it "cannot be edited by a non authorized user" do
			logout(@user)
			non_authorized_user = FactoryGirl.create(:user)
			login_as(non_authorized_user, scope: :user)
			visit edit_post_path(@post)

			expect(current_path).to eq(root_path)
		end
	end

	describe 'delete' do
		it "can be deleted" do
			@post = FactoryGirl.create(:post)
			@post.update(user_id: @user.id)
			visit posts_path

			expect { click_link("destroy_post_#{@post.id}") }.to change(Post, :count).by(-1)
		end
	end
end