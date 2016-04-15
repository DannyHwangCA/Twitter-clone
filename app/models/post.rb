class Post < ActiveRecord::Base
  belongs_to :user
  # This will display posts order from latest down to the earliest.
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
