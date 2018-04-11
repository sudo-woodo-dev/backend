class Review < ApplicationRecord

    belongs_to(:user)
    belongs_to(:area)

    validates :area, presence: true
    validates :area_rating, presence: true, numericality:  { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
    validates :dining, presence: true, numericality:  { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
    validates :parking, presence: true, numericality:  { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
    validates :cleanliness, presence: true, numericality:  { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
    validates :safety, presence: true, numericality:  { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
    # validates :family_friendly, presence: true
    validates :review_text, presence: true
    validates :price, presence: true
    validates :user, presence: true
    
end
