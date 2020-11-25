class Booking < ApplicationRecord
  belongs_to :outfit
  belongs_to :user
  # has_one :subject, class_name: "User", source: :user, through: :outfits

  validates :address, presence: true
  validates :user, presence: true
  # validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
end
