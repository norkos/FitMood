class Micropost < ActiveRecord::Base
   belongs_to :user
   validates :user_id, presence: true
   default_scope -> { order('created_at DESC') }
   validates :content, presence: true, length: { maximum: 140 }

  # Returns microposts from the users being followed by the given user.
  def Micropost.from_users_followed_by(user)
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: user)
  end

end