class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])  # Fetch a single post for detailed view
  end
end
