class Post < ApplicationRecord

    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 255 }

end
