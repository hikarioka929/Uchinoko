class Post < ApplicationRecord
    belongs_to :pet
    belongs_to :user

    attachment :image
end
