user = User.create(email: 'test@test.com', password: "test_pass", password_confirmation: 'test_pass', first_name: "Test", last_name: "test", phone: "1234567890")
AdminUser.create(email: 'admin@test.com', password: "test_pass", password_confirmation: 'test_pass', first_name: "Admin", last_name: "Name", phone: "1234567890")

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: user.id, overtime_request: 1.4)
end

100.times do |post|
	AuditLog.create(user_id: user.id, status: 0, start_date: Date.today-6.days)
end