require 'rails_helper'

describe "Review" do
    it "creates a review" do
        review = Review.create(area: 'Gaslamp', dining: 5, parking: 5,
        cleanliness: 5, safety: 5, price: 23, family_friendly: true, review_text: 'Great place', user_ref: 1)
        expect(review.area).to be_a String
    end

    it "creates a review v2" do
        expect{Review.new}.to_not raise_error
    end

    it "can't create review without area" do
        review = Review.create(dining: 5, parking: 5,
        cleanliness: 5, safety: 5, price: 23, family_friendly: true, review_text: 'Great place', user_ref: 1)
        expect(review).to_not be_valid
    end

    it "can't create review without parking" do
        review = Review.create(area: 'Gaslamp', dining: 5,
        cleanliness: 5, safety: 5, price: 23, family_friendly: true, review_text: 'Great place', user_ref: 1)
        expect(review).to_not be_valid
    end

    it "can't create review without cleanliness" do
        review = Review.create(area: 'Gaslamp', dining: 5, parking: 5,
         safety: 5, price: 23, family_friendly: true, review_text: 'Great place', user_ref: 1)
        expect(review).to_not be_valid
    end

    it "can't create review without safety" do
        review = Review.create(area: 'Gaslamp', dining: 5, parking: 5,
        cleanliness: 5, price: 23, family_friendly: true, review_text: 'Great place', user_ref: 1)
        expect(review).to_not be_valid
    end

    it "can't create review without price" do
        review = Review.create(area: 'Gaslamp', dining: 5, parking: 5,
        cleanliness: 5, safety: 5, family_friendly: true, review_text: 'Great place', user_ref: 1)
        expect(review).to_not be_valid
    end

    it "can't create review without family friendly" do
        review = Review.create(area: 'Gaslamp', dining: 5, parking: 5,
        cleanliness: 5, safety: 5, price: 23, review_text: 'Great place', user_ref: 1)
        expect(review).to_not be_valid
    end

    it "can't create review without text review" do
        review = Review.create(area: 'Gaslamp', dining: 5, parking: 5,
        cleanliness: 5, safety: 5, price: 23, family_friendly: true, user_ref: 1)
        expect(review).to_not be_valid
    end
end
