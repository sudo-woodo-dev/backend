class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :area
      t.float :area_rating
      t.float :dining
      t.float :parking
      t.float :cleanliness
      t.float :safety
      t.float :price
      t.boolean :family_friendly
      t.string :review_text
      t.integer :user_ref

      t.timestamps
    end
  end
end
