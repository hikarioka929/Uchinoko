class Pet < ApplicationRecord
    belongs_to :user
    has_many :posts
    enum sex: {man:"0", women:"1"}

    attachment :image

    with_options presence: true do
        validates :name
        validates :sex
        validates :age
        validates :image
    end
end
