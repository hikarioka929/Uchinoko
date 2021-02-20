class Genre < ApplicationRecord

    has_many :pets
    validates :name, presence: true, uniqueness: true
end
