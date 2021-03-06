class Post < ApplicationRecord
    belongs_to :pet
    belongs_to :user

    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    attachment :image

    with_options presence: true do
        validates :title
        validates :body
        validates :pet_id
    end

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
