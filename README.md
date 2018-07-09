# README
[TQR](https://touqeer-ahmad.herokuapp.com/)

# rails actionmailer sample/example app

- simple demo actionmailer rails app to send emails
- you can also send email from local
- actionmailer
- SMTP with gmail
- send email using gmail

## Steps
- First you need to **turn on access for less secure apps** https://myaccount.google.com/lesssecureapps

- Create rails project with rails version > 4
`rails _4.2.6_ new sample_email_app`

- Add following lines at the end of `config/environment.rb`
	```sh
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
	```
- Replace **user_name** and **password** with your **gmail** username and password
- Create a mailer file 
`rails generate mailer Usermailer`
This will create a file **user_mailer.rb** in the **app\mailer** directory.

- Add following method in **user_mailer.rb**
```sh
def welcome_email(email_address)
	mail(to: email_address, subject: 'Test Email')
end
```
- Now we need to create a template file which will be used to email.
Create a file **welcome_email.html.erb** in **app/views/user_mailer/**
And add the following lines:
```sh
<html>
   <head>
      <meta content = 'text/html; charset = UTF-8' http-equiv = 'Content-Type' />
   </head>
   <body>
      <h1>Welcome to Test Email</h1>
   </body>
</html>
```
- Also make a text part for this email, sending both is best practice
Create a file **welcome_email.text.erb** in **app/views/user_mailer/**
And add the following lines:
```sh
Welcome to Test Email
```
Add the following lines to **routes.rb**
```sh
root "users#index"
get "users/send_email"
```
- Create a user controller `controllers/users_controller.rb`
And add following methods for index page and send_email action
	```sh
	  def index
	  end

	  def send_email
		Usermailer.welcome_email(params[:email]).deliver_later
		respond_to do |format|
		  format.html { redirect_to root_path, notice: 'Email Sent, Check Inbox' }
		  format.json { head :no_content }
		end
	  end
	```
- Create **index.html.erb** file in **app/views/users/**
And add following lines to it:
	```sh
	<p id="notice"><%= notice %></p>

	<%= form_tag users_send_email_path, method: 'get' do %>
	  <div class="field">
		<%= label_tag :email %>
		<%= text_field_tag :email, nil, style: "width: 100%; max-width: 300px;" %>
	  </div>
	  <div class="actions">
		<%= submit_tag "send email" %>
	  </div>
	<% end %>
	```
	
### And you are ready to go :)
- run `rails s`
- open `localhost:3000`
- enter email address
- click **send email**
- check email in inbox

#### Have a Great DayHave a Great Day
