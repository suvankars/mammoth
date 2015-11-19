class SubcategoriesController < ApplicationController
	def create
		@category = Category.find(params[:category_id])
		@subcategory = @category.subcategories.create(subcategory_params)
		if @subcategory.save
			redirect_to category_path(@category), :flash => { :notice => "Successfully creayed subcategory " }
		else
			redirect_to category_path(@category), :flash => { :notice => "Something went wrong" }
		end
	end

	private
	def subcategory_params
		params.require(:subcategory).permit(:name, :description)	
	end
end
