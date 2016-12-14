class ReviewsController < ApplicationController
	before_action :find_location
	def new 
		@review = Review.new
	end 


	def create 
		@review = Review.new(review_params)
		@review.location_id = @location.id
		@review.user_id = current_user.id


		if @review.save
			redirect_to location_path(@location)
		else
			render 'new'
		end

	end

	private 

	def review_params
		params.require(:review).permit(:rating, :comment)
	end

	def find_location
		@location = Location.find(params[:location_id])
	end


end
