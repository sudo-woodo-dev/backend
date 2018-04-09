class RemoveUserRefIdAndUserRefFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :user_ref_id, :integer
    remove_column :reviews, :user_ref, :integer
  end
end
