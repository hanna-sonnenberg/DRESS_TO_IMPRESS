class Review < ApplicationRecord
  belongs_to :outfit
  belongs_to :user
  # has_one :subject, class_name: "User", through: :outfits, source: :user

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: {
    in: 0..5
  }
  validates :content, presence: true, length: { minimum: 5 }
end

