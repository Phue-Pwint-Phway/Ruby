class Post < ApplicationRecord

    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 255 }

    def self.import(file)
        CSV.foreach(file.path, header: true) do |row|
            User.create! row.to_hash
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
