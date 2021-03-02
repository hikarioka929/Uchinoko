class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :pets, dependent: :destroy
        has_many :posts, dependent: :destroy
        has_many :post_comments, dependent: :destroy
        has_many :favorites, dependent: :destroy

        attachment :image

        validates :name, presence: true

        #フォロワー
        has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followee_id'
        has_many :followers, through: :reverse_of_relationships, source: :follower

        #フォローしてる人
        has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id'
        has_many :followings, through: :relationships, source: :followee

        def following?(another_user)
          self.followings.include?(another_user)
        end
      
        def follow(another_user)
          unless self == another_user
            self.relationships.find_or_create_by(followee_id: another_user.id, follower_id: self.id)
          end
        end
        
        def unfollow(another_user)
          unless self == another_user
            relationship = self.relationships.find_by(followee_id: another_user.id, follower_id: self.id)
            relationship.destroy if relationship
          end
        end
end