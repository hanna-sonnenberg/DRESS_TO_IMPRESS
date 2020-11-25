class AddDescriptionToOutfits < ActiveRecord::Migration[6.0]
  def change
    add_column :outfits, :description, :text
  end
end
