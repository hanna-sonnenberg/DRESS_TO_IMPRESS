class CreateOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :size
      t.string :gender
      t.integer :price
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :location

      t.timestamps
    end
  end
end
