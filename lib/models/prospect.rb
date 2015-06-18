class Prospect < ActiveRecord::Base
  validates :email, :list_name, presence: true
end
