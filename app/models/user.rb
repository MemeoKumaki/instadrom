class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :follows, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :follows, source: :followed
  has_many :followers, through: :follows, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, presence: true, length: {maximum: 50}

  def following?(other_user)
    follows.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follows.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follows.find_by(followed_id: other_user.id).destroy!
  end
end
