class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: { minimum: 50 }
    belongs_to :admin
end
