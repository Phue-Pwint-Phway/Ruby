class Post < ApplicationRecord
    # belongs_to :user

    # belongs_to :user, class_name: 'User', foreign_key: 'create_user_id'
    # belongs_to :user, class_name: 'User', foreign_key: 'updated_user_id'

    belongs_to :created_user, class_name: "User", foreign_key: "create_user_id"
    belongs_to :updated_user, class_name: "User", foreign_key: "updated_user_id"

    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 255 }

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Post.create! row.to_hash
        end
    end

    def self.to_csv
        attributes = %w{id title description created_at updated_at}
        CSV.generate do |csv|
            csv << attributes
            all.find_each do |post|
                csv << attributes.map { |attr| post.send(attr) }
            end
        end
    end
end
