class Prospect < ActiveRecord::Base
  validates :email, :list_name, presence: true

  before_save :set_default_data

  protected

  def set_default_data
    self.data = {} if data.nil?
  end
end
