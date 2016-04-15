class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save {self.email.downcase!}
  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length:     { maximum: 150 },
                                    format:     { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }

end

