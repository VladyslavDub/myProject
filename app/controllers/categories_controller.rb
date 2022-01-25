class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @pins = @category.pins
  end

  def destroy
    if @category = Category.find(params[:id])
      @category.destroy
      return redirect_back(fallback_location: root_path)
    end
  end
  
end
