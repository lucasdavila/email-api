ENV['ENV'] = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'

module Initializers
  module Env
    def mail_config
      YAML.load_file 'config/mail.yml'
    end

    module_function :mail_config
  end
end

Initializers::Env.mail_config[ENV['ENV']].each do |name, value|
  ENV['mail_' + name] = value.to_s
end
