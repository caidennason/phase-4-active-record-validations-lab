class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbait_post

    def clickbait_post
        # byebug
        if title == "" || title == nil
            false
        else 
            unless title.include?("Won't Believe") || title.include?("Secret")
                errors.add(:title, "Not Good Enough")
            end
        end
    end

end
