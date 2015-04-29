if Rails.env.development? 
	ActionMailer::Base.delivery_method = :smtp
	ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
	ActionMailer::Base.smtp_settings = {
    	address: "smtp.gmail.com",
    	port: 587,
    	domain: 'localhost:3000',
    	authentication: "plain",
    	enable_starttls_auto: true,
    	user_name: ENV['GMAIL_USERNAME_DEV'],
    	password: ENV['GMAIL_PASSWORD_DEV']
  	}
end

if Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        address: 'smtp.sendgrid.net',
        port: '587',
        authentication: :plain,
        user_name: ENV['SENDGRID_USERNAME'],
        password: ENV['SENDGRID_PASSWORD'],
        domain: 'heroku.com',
        enable_starttls_auto: true
    }
end