class ContactController < ResourceController
  post '/' do
    post_resource
  end

  protected

  def after_post
    send_email if template_exists?
  end

  def template_exists?
    File.exists? template_path
  end

  def template_path
    "lib/templates/#{params[:list_name]}.yml"
  end

  def send_email
    mail = Mail.new
    mail.to = params[:email]
    mail.from = ENV['mail_from_name'] ? "#{ENV['mail_from_name']} <#{ENV['mail_from']}>" : ENV['mail_from']
    mail.subject = email_subject
    mail.content_type 'text/html; charset=UTF-8'
    mail.body = email_body

    mail.deliver!
  end

  def template
    @template ||= YAML.load_file template_path
  end

  def email_subject
    @params = params

    ERB.new(template['subject']).result binding
  end

  def email_body
    @params = params

    ERB.new(template['body']).result binding
  end
end
