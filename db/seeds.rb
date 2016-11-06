# create a user
user = User.create(email: "user@example.com", password: "12341234", slack_username: "example_user")

# create reports
Report.skip_callback(:save, :after, :send_message_to_slack)
(1..100).each do |n|
	user.reports.create(done_yesterday: "Example", doing_today: "Example")
	puts "1 reported created"
end
Report.set_callback(:save, :after, :send_message_to_slack)
