class Booking < ApplicationRecord
  belongs_to :outfit
  belongs_to :user

  validates :address, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
end
