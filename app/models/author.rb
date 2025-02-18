class Author < ApplicationRecord
    has_many :posts
  
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  
    # Allow the 'posts' association to be searchable with Ransack
    def self.ransackable_associations(auth_object = nil)
      # Ensure we can search through associated posts' attributes
      ["posts"]
    end
  
    # Optionally, if you want to control ransackable attributes at a more granular level
    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "email", "created_at", "updated_at"] # Allow searching on 'id' and 'name' of Author itself
    end
  end
  