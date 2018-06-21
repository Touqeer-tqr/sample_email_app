class Usermailer < ApplicationMailer

	def welcome_email(email_address)
		mail(to: email_address, subject: 'Test Email')
	end
   
end
