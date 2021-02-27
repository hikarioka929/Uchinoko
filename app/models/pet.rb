class Pet < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :posts
    enum sex: {男の子:0, 女の子:1}

    attachment :image

    with_options presence: true do
        validates :name
        validates :sex
        validates :age
        validates :image
        validates :genre_id
    end
end
