require 'rails_helper'

describe 'AuditLog features' do
	before do 
		@admin_user = FactoryGirl.create(:admin_user)
		login_as(@admin_user, scope: :user)
		@audit_log = FactoryGirl.create(:audit_log)
	end

	describe "index" do
		it "has an index page that can be reached" do
			visit audit_logs_path
			expect(page.status_code).to eq(200)
		end

		it "shows audit logs on the index page" do 
			visit audit_logs_path
			expect(page).to have_content(/Test/)
		end

		it "cannot be accessed by non admins" do
			logout(:user)
			user = FactoryGirl.create(:user)
			login_as(user, scope: :user)

			visit audit_logs_path
			expect(current_path).to eq(root_path)
		end
	end
end