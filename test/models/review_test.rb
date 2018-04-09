require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
    it "creates a review" do
        review = Review.create(area: 'Gaslamp', dining: 5, parking: 5,
        cleanliness: 5, safety: 5, price: 23, family_friendly: true, review_text: 'Great place', userID: 1)
        expect(review.area).to eq 'Gaslamp'
    end
end
