class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts # All posts under the selected category
  end
end
