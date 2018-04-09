class AddAreaIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :area, foreign_key: true
  end
end
