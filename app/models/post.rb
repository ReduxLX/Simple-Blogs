class Post < ApplicationRecord
    # Implement Validation
    # Title field must not be empty and must be 5 characters long
    validates :title, presence: true, length: {minimum: 5}

    # Implement relationship, 1 post can have 0 or many comments
    has_many :comments, dependent: :destroy
end
