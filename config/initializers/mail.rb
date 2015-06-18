Mail.defaults do
  delivery_method ENV['mail_delivery_method'],
                  address: ENV['mail_address'],
                  port: ENV['mail_port'],
                  enable_starttls_auto: ENV['mail_enable_starttls_auto'],
                  user_name: ENV['mail_user_name'],
                  password: ENV['mail_password'],
                  authentication: ENV['mail_authentication'],
                  domain: ENV['mail_domain']
end
