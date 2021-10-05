class User < ApplicationRecord
    # acts_as_paranoid
    # include Visible
    # has_many :posts
    has_secure_password

    # has_many :posts, class_name: 'Post'
    # has_many :posts, class_name: 'Post'


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
        "#{self.name}"
    end

    def createUserName
        if create_user_id
            created_name = user.create_user_id.name
        end
    end
end
