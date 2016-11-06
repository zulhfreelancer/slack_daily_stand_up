SLACK_NOTIFIER = Slack::Notifier.new(
	                                  ENV["SLACK_WEBHOOK_URL"],
	                                  channel: "#general"
	                                )
