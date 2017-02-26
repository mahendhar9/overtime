namespace :notification do
  desc "Sends an SMS to employees asking if they had overtime or not"
  task sms: :environment do
  	puts "Send SMS"
  end

end
