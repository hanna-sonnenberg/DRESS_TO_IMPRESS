class Review < ApplicationRecord
  belongs_to :outfit

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: {
    in: 0..5
  }
  validates :content, presence: true, length: { minimum: 5 }
end
