class LocationsController < ApplicationController
	before_action :find_location, only: [:show, :edit, :update, :destroy]

	def index 
		if params[:category].blank?

		@locations = Location.all
	else 
		@category_id = Category.find_by(names: params[:category]).id
		@locations = Location.where(:category_id => @category_id).order("created_at DESC")
	end

	end 


	def show 
	end 



	def search
		@locations = Location.search params[:place]
	unless @locations.empty? #if !@modelnames.empty?
		render 'index'
	else
	     flash[:notice] = 'No record matches that search'
	     render 'index'

	 end
	end



	def new 
		@location = current_user.locations.build
		@categories = Category.all.map{ |c| [c.names, c.id] }
	end 

	def create 
		@location = current_user.locations.build(location_params)
		@location.category_id = params[:category_id]

		 if  @location.save
		 	redirect_to root_path
		 else
		 	render 'new'
		 end 


	end 

	def update 
		if @location.update(location_params)
			redirect_to location_path(@location)

		else 
			render 'edit'
		end 


	end 

	def edit 
		@categories = Category.all.map{ |c| [c.names, c.id]}
	end 

	def destroy 
		@location.destroy 
		redirect_to root_path
	end 

	private 

	def location_params 
		params.require(:location).permit(:place , :category_id, :image)
	end 

	def find_location
		@location = Location.find(params[:id])

	end 




end
