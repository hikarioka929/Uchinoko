class Post < ApplicationRecord
    belongs_to :pet
    belongs_to :user

    attachment :image

    with_options presence: true do
        validates :title
        validates :body
        validates :pet_id
    end
end
