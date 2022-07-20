class Disaster < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :address
  validates_presence_of :type_id

  has_many :comments
  belongs_to :user
  belongs_to :type
end
