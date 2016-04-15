class User < ActiveRecord::Base
  has_many :posts

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy

  has_many :followings, through: :active_relationships, source: :followed_id
  has_many :followers, through: :passive_relationships, source: :follower_id

end
# has_many :followers, through: :relationships, source: :
