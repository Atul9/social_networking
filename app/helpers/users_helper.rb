module UsersHelper
  def friend(user)
    current_user.friends_with?(user)
  end
end
