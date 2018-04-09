class AddIndexToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :user_ref, foreign_key: true
  end
end
