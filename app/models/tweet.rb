class Tweet < ActiveRecord::Base
  belongs_to :user
  def self.from_users_followed_by(user)
    joins(:user => :followed_by).where("follows.follower_id = ?", user.id)
  end
end
