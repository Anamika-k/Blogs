# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# db/seeds.rb

# Example using HTTParty to fetch data from an API
# Load the Faker gem to generate random data
require 'faker'


# Create Posts by Admin User
categories = Category.all
authors = Author.all

5.times do
  # Generate fake data
  post = Post.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    published_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
    author_id: Author.all.sample.id,  # Randomly assign an author from the existing authors
    category_id: Category.all.sample.id  # Randomly assign a category from the existing categories
  )

  # Attach a random image using ActiveStorage
  image_url = "https://picsum.photos/300/300"  # Random image with 300x300 dimensions
  
  # Download the image and attach it to the post using ActiveStorage
  io = URI.open(image_url)  # Open the image from the URL
  post.images.attach(io: io, filename: "image_#{post.id}.jpg")
end

puts "Seeded #{Post.count} posts with images attached."