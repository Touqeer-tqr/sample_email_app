# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
	config.action_mailer.delivery_method = :smtp

	config.action_mailer.smtp_settings = {
	   address:              'smtp.gmail.com',
	   port:                 587,
	   domain:               'example.com',
	   user_name:            'touqeer.ahmad@aldaimsolutions.com',
	   password:             'tqr@aldaim*',
	   authentication:       'plain',
	   enable_starttls_auto: true  
	}
end
ActionMailer::Base.default :content_type => "text/html"