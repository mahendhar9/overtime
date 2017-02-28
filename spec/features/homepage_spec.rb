require 'rails_helper'

describe "Homepage" do 
	it "allows the admin to approve posts" do
		admin_user = FactoryGirl.create(:admin_user)
		login_as(admin_user, scope: :user)
		post = FactoryGirl.create(:post)

		visit root_path
		click_on("approve_post_#{post.id}")
		expect(post.reload.status).to eq('approved')
	end
end