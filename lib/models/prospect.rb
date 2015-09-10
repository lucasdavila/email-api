class Prospect < ActiveRecord::Base
  validates :email, :list_name, presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [:create, :update]

  before_save :set_default_data

  protected

  def set_default_data
    self.data = {} if data.nil?
  end
end
