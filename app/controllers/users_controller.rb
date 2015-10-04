class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def friends
    @friends = current_user.friends
  end

  def people
    @users = current_user.friends.count.zero? ? User.where.not(id: current_user.id) :
                                                User.where.not(id: [current_user.id, current_user.friends.pluck(:id)])
  end

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

  def show
    @user = User.find(params[:id])
  end

  protected

  def user_params
    params.require(:user).permit(:firstname, :username, :lastname, :avatar, :email, :password, :confirmation_password)
  end

end
