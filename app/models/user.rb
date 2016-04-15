class User < ActiveRecord::Base
  include BCrypt

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

  def password
    @password ||= Password.new(password_hash) if password_hash.present?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

  def follow(another_user)
    active_relationships.create(followed_id: another_user.id)
  end

  def unfollow(another_user)
    active_relationships.find_by(followed_id: another_user.id).destroy
  end

end



# class User
#   has_many :followers, class_name: "User", foreign_key: "followee_id"

#   belongs_to :followee, class_name: "User"

# end


