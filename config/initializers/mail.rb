Mail.defaults do
  options = {
    address: ENV['mail_address'],
    port: ENV['mail_port'],
    enable_starttls_auto: ENV['mail_enable_starttls_auto'],
    user_name: ENV['mail_user_name'],
    password: ENV['mail_password'],
    authentication: ENV['mail_authentication']
  }

  # prevent Net::SMTPSyntaxError - 501 5.0.0 HELO requires domain address error
  # if there is no domain defined.
  options[:domain] = ENV['mail_domain'] if ENV['mail_domain']

  delivery_method ENV['mail_delivery_method'], options
end
