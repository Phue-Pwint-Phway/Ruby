class User < ApplicationRecord
    # has_many :posts
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true, length: { in: 6..20 }
    validates :password_confirmation, presence: true, length: { in: 6..20 }
    validates :role, presence: true
    validates :phone, presence: true, length: { maximum: 20 }, numericality: true
    validates :dob, presence: true
    validates :address, presence: true, length: { maximum: 255 }
    validates :profile, presence: true, length: { maximum: 255 }

    def welcome
        "Hello, #{self.name}!"
    end    
end
