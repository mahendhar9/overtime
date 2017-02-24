require 'rails_helper'

describe 'navigate' do

	before do
		@user = User.create(email: 'test@test.com', password: "test_pass", password_confirmation: 'test_pass', first_name: "Test", last_name: "test")
		login_as(@user, scope: :user)
	end

	describe 'index' do
		it 'can be reached successfully' do
			visit posts_path
			expect(page.status_code).to eq(200)
		end

		it "has a title of Posts" do
			visit posts_path
			expect(page).to have_content(/Posts/) 
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
			click_on "Save"
			
			expect(page).to have_content("Some rationale")
		end

		it "has a user associated with it" do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "User Association"
			click_on "Save"
			
			expect(@user.posts.last.rationale).to eq("User Association")
		end
	end
end