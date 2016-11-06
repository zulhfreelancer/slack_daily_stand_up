class DateTimeHelper
	def self.in_malaysia_time(time_object)
		time_object.in_time_zone('Asia/Kuala_Lumpur').strftime('%A - %d/%m/%Y')
	end
end