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
response = HTTParty.get('https://api.example.com/articles')
articles = response.parsed_response

articles.each do |article_data|
  category = Category.find_or_create_by(name: article_data['category'])
  Article.create(
    title: article_data['title'],
    content: article_data['content'],
    category: category
  )
end
