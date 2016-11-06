class GravatarHelper
	require 'digest/md5'

	def self.url(user_email)
		email_address = user_email.downcase
		hash          = Digest::MD5.hexdigest(email_address)
		return "https://www.gravatar.com/avatar/#{hash}"
	end
end
