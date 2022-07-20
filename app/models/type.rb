class Type < ApplicationRecord
  validates_presence_of :category
  has_many :disasters
end
