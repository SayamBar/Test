class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    scope :created, ->{where.not(created_at: nil)}
end
