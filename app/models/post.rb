class Post < ApplicationRecord
    # Implement Validation
    # Title field must not be empty and must be 5 characters long
    validates :title, presence: true, length: {minimum: 5}
end
