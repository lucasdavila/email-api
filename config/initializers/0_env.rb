ENV['ENV'] = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'

module Initializers
  module Env
    def mail_config
      YAML.load_file 'config/mail.yml'
    end

    def validate_mail_config!
      if mail_config.blank? || mail_config[ENV['ENV']].blank?
        raise "Please define the mail config for the #{ENV['ENV']} env in the config/mail.yml file."
      end
    end

    module_function :mail_config, :validate_mail_config!
  end
end

Initializers::Env.validate_mail_config!

Initializers::Env.mail_config[ENV['ENV']].each do |name, value|
  ENV['mail_' + name] = value.to_s
end
