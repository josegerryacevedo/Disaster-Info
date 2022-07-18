class Disaster < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :address
  validates_presence_of :long_url

  belongs_to :user
end
