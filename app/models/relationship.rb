class Relationship < ActiveRecord::Base
  belongs_to :followers, class_name: "User"
  belongs_to :followings, class_name: "User"
end
