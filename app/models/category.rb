class Category < ApplicationRecord
    has_many :posts

    validates :name, presence: true, uniqueness: true

    def self.ransackable_associations(auth_object = nil)
        ["posts"]  # Allow posts association to be used in search filters
    end

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "created_at", "updated_at"]
      end
end
