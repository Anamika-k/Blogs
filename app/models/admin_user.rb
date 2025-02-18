class AdminUser < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    # Return only the attributes you want to be searchable (avoid sensitive data like password)
    ["created_at", "email", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
