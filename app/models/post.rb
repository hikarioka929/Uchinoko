class Post < ApplicationRecord
    belongs_to :pet
    belongs_to :user

    has_many :post_comments, dependent: :destroy

    attachment :image

    with_options presence: true do
        validates :title
        validates :body
        validates :pet_id
    end
end
