class ChangeRentingToRating < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :renting, :rating
  end
end
