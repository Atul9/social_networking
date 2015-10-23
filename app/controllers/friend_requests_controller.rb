class FriendRequestsController < ApplicationController
  def send_friend_request
    send_to = User.find(params[:id])
    current_user.friend_request(send_to)
    redirect_to people_user_path
  end

  def pending_friend_requests
    @users = current_user.requested_friends
  end

  def accept_friend_request
    sent_from = User.find(params[:id])
    current_user.accept_request(sent_from)
    redirect_to people_user_path
  end
end
