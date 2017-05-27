class Comment < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :content, presence: true, length: { minimum: 1, maximum: 400 }
    belongs_to :article
end
