class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  has_many :follows, :class_name => "Follow", :foreign_key => :follower_id
  has_many :followed_by, :class_name => "Follow", :foreign_key => :followee_id
  has_many :following, :through => :follows, source: :followee
  has_many :followers, :through => :followed_by, source: :follower
  validates :email, presence: true, uniqueness: true

  def does_follow(user)
    follows.where(:followee_id => user.id).first
  end

  def is_followed_by(user)
    followed_by.where(:follower_id => user.id).first
  end

end
