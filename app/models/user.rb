class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, email: true
  validates :password, presence: true, length: { in: 6..20 }

  has_many :outfits
  has_many :bookings
  has_many :reviews, through: :bookings

  # has_one_attached :photo
end
