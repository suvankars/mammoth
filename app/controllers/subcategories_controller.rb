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

  def edit
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:id])
    if @subcategory.update(subcategory_params)
      redirect_to category_path(@category), :flash => {:notice => "Successfully updated"}
    else
      render 'edit'
    end
  end

	private
	def subcategory_params
		params.require(:subcategory).permit(:name, :description)	
	end
end
