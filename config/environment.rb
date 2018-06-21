# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
   config.action_mailer.raise_delivery_errors = true
end

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :domain         => 'mail.google.com',
  :port           => 587,
  :user_name      => 'info@example.com',
  :password       => 'password',
  :authentication => :plain,
  :enable_starttls_auto => true
}
ActionMailer::Base.default :content_type => "text/html"