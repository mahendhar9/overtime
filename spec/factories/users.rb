FactoryGirl.define do
	sequence :email do |n|
		"test#{n}@example.com"
	end

	factory :user do
		first_name "Test"
		last_name "test"
		email { generate :email }
		password "test_pass"
		password_confirmation 'test_pass'
		phone "1234567890"
	end

	factory :admin_user, class: 'AdminUser' do
		first_name "Admin"
		last_name "User"
		email { generate :email }
		password "test_pass"
		password_confirmation 'test_pass'
		phone "1234567890"
	end

	factory :other_user, class: 'User' do
		first_name "Other"
		last_name "User"
		email { generate :email }
		password "test_pass"
		password_confirmation 'test_pass'
		phone "1234567890"
	end
end
