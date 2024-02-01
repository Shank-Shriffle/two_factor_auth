# Email/SMTP Configuration
require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    address: "smtp.gmail.com",
    port: 587,
    user_name: ENV['EMAIL_ADDRESS'],
    password: ENV['EMAIL_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
end