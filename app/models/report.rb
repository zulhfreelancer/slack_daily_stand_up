class Report < ApplicationRecord
	belongs_to :user
	validates_presence_of [:done_yesterday, :doing_today]
	after_save :send_message_to_slack

	def send_message_to_slack
		PingSlackJob.perform_later(self.id) # report ID
	end
end
