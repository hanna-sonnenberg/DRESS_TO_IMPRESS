class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, email: true
  validates :password, presence: true, length: { in: 6..20 }

  has_many :outfits, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews
  # has_many :incoming_reviews, through: :outfits, class_name: "Outfit", source: :outfit
  # has_many :incoming_bookings, through: :outfits, class_name: "Outfit", source: :outfit

  # has_one_attached :photo
  def full_name
    first_name + " " + last_name

  end
end
