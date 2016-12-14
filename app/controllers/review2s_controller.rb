class Review2sController < ApplicationController

def create
 @location = Location.find params[:location_id]
 @review2 = @location.review2s.new(review2_params)
 @review2.user_id = current_user.id 
#sets the user_id FK
 @review2.save #saves the @comment
#object to the comments table
respond_to do |format|
format.html { redirect_to @location }
 end
end


private
def review2_params #This is the method which whitelists the data fields from the form
 params.require(:review2).permit(:content, :location_id, :user_id, :stars)
end










end
