class Outfit < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :size, presence: true, inclusion: { in: %w(xs s m l xl) }
  validates :gender, presence: true, inclusion: { in: %w(male female) }
  validates :price, presence: true
  validates :category, presence: true, inclusion: { in: ["gala", "christmas", "carnaval", "halloween", "new year"] }
  validates :location, presence: true
  # validates :start_date, :end_date, presence: true
  # validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
