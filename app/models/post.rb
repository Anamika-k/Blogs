class Post < ApplicationRecord
  has_rich_text :description
  has_many_attached :images

  belongs_to :author
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  # Add ransackable associations if needed (useful for filtering with relations like category)
  def self.ransackable_associations(auth_object = nil)
    ["posts", "categories"]
  end

  # Specify which attributes are searchable with Ransack, including the body of the rich text field
  def self.ransackable_attributes(auth_object = nil)
    super + ['description_body', 'author_id', 'category_id', 'created_at', 'id', 'published_at', 'title', 'updated_at']
  end
end

