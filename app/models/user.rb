class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :comments
  has_many :disasters

  def client?
    role == 'client'
  end

  def admin?
    role == 'admin'
  end

end
