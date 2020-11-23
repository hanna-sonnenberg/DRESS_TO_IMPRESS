class Outfit < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :size, presence: true, inclusion: { in: %w(xs s m l xl) }
  validates :gender, presence: true, inclusion: { in: %w(male female) }
  validates :price, presence: true
  validates :category, presence: true, inclusion: { in: %w(gula ) }
end
