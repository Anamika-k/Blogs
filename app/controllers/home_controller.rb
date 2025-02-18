class HomeController < ApplicationController
  def index
    @categories = Category.all # Fetch all categories
    @posts = Post.limit(10).order(created_at: :desc) # Latest 10 posts for the homepage
  end
end
