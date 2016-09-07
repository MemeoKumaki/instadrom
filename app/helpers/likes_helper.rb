module LikesHelper

  def like_exists?(user, post)
    Like.exists?(:user_id => user, :post_id => post)
  end
  
end
