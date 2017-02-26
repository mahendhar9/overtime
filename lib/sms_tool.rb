module SmsTool
	def self.send_sms(number: num, message: msg)
		puts "Sending SMS..."
		puts "#{number}"
		puts "#{message}"
	end
end