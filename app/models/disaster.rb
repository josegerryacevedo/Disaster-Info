class Disaster < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :address

  has_many :comments
  belongs_to :user
  belongs_to :type
  mount_uploader :image, ImageUploader
end
