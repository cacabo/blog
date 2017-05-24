class Admin < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :articles
    validate :one_admin

    private

    def one_admin
        if (not Admin.count == 0)
            errors.add(:id, "There can only be 1 administrator")
        end
    end
end
