class Usermailer < ApplicationMailer
	default from: 'info@techlexity.com'
   
	def welcome_email(user)
		@url  = 'http://www.gmail.com'
		mail(to: "touqeer.ahmad@aldaimsolutions.com", subject: 'Welcome to My Awesome Site')
	end
   
end
