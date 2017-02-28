require 'rails_helper'

RSpec.describe AuditLog, type: :model do
	before do
		@audit_log = FactoryGirl.create(:audit_log)
	end

	describe "creation" do 
		it "can be properly created" do
			expect(@audit_log).to be_valid
		end
	end

	describe "validations" do
		it "should always have a status, user_id and start_date" do
			@audit_log.status = nil
			@audit_log.user_id = nil
			@audit_log.start_date = nil
			expect(@audit_log).to_not be_valid
		end

		it "should have a start date equal to 6 days prior" do
			new_audit_log = AuditLog.create(user_id: User.last.id)
			expect(new_audit_log.start_date).to eq(Date.today-6.days)
		end
	end
end
