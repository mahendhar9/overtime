user = User.create(email: 'test@test.com', password: "test_pass", password_confirmation: 'test_pass', first_name: "Test", last_name: "test")

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: user.id)
end