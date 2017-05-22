class Comment < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :content, presence: true, length: { minimum: 1 }
    belongs_to :article
end
