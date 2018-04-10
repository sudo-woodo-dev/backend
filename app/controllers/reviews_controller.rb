class ReviewsController < ApplicationController

  before_action :authenticate_user!
  # load_and_authorize_resource

    def index
      review = Review.where params[:user_id]
      render json: review, status: 201
    end


    def show
      review = Review.find params[:id]
      render json: review, status: 200
    end

    def create
      review = Review.new(review_params)
      if review.save
        render json: review, status: 201
      else
        render json: { errors: review.errors }, status: 422
      end
    end

    def reviews_by_user_id
      review = Review.where("user_id = #{params[:user_id]}")
      render json: review, status: 200
    end

    def reviews_by_area_id
      review = Review.where("area_id = #{params[:area_id]}")
      render json: review, status: 200
    end

    def avg_review_area
      avgAreaRating = Review.where("area_id = #{params[:area_id]}").average(:area_rating)
      avgParking = Review.where("area_id = #{params[:area_id]}").average(:parking)
      avgCleanliness = Review.where("area_id = #{params[:area_id]}").average(:cleanliness)
      avgSafety = Review.where("area_id = #{params[:area_id]}").average(:safety)
      avgDining = Review.where("area_id = #{params[:area_id]}").average(:dining)
      avgPrice = Review.where("area_id = #{params[:area_id]}").average(:price)
      render json: { rating: avgAreaRating, parking: avgParking, cleanliness: avgCleanliness, safety: avgSafety, dining: avgDining, price: avgPrice }, status: 200
    end

    private
    def review_params
      params.require(:review).permit(:area_rating, :dining, :parking, :cleanliness,
       :safety, :price, :family_friendly, :review_text, :avatar_base, :user_id, :area_id)
    end
   end
