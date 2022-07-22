class Disaster < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :address


  has_many :comments
  belongs_to :user
  belongs_to :type
  mount_uploader :image, ImageUploader

  before_create :generate_unique_number

  def generate_unique_number
    loop do
      @short_num = 4.times.map{rand(9)}.join
      break unless Disaster.exists?(short_url: @short_num)
    end
    self.short_url = @short_num
  end


end
