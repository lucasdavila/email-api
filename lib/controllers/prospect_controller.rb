class ProspectController < ResourceController
  post '/' do
    post_resource
  end

  protected

  def before_post
    unless template_exists?
      halt 400, { errors: { list_name: [ 'there is no template for this list' ] } }.to_json
    end
  end

  def after_post
    send_email
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
    mail.from = ENV['mail_from']
    mail.subject = template['subject']
    mail.body = email_body

    mail.deliver!
  end

  def template
    @template ||= YAML.load_file template_path
  end

  def email_body
    @params = params

    ERB.new(template['body']).result binding
  end
end
