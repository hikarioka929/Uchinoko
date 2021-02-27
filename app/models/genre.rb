class Genre < ApplicationRecord

    has_many :pets, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end
