require 'rails_helper'

RSpec.describe User, type: :model do
	before do 
		@user = FactoryGirl.create(:user)
	end

	describe "creation" do
		it "can be created" do
			expect(@user).to be_valid
		end
	end

	describe "validations" do
		it "cannot be created without firstname, lastname" do
			@user.first_name = nil
			@user.last_name = nil
			@user.phone = nil
			expect(@user).to_not be_valid
		end

		it "requires the phone attribute to only contain integers" do 
			@user.phone = "mygreatstr"
			expect(@user).to_not be_valid
		end

		it "requires the phone arr to only have 10 characters" do
			@user.phone = "12345678901"
			expect(@user).to_not be_valid
		end
	end

	describe "custom name method" do
		it "has a full name method that combines first and last name" do
			expect(@user.full_name).to eq('Test test')
		end
	end
end
