class SubscriberController < ResourceController
  post '/' do
    post_resource
  end

  protected

  def before_post
    if params[:list_name].blank?
      halt 400, { errors: { list_name: [ 'The list_name param is required' ] } }.to_json
    end
  end

  def resource_class_name
    'Prospect'
  end
end
