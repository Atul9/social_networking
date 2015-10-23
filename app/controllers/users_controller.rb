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
    @users = User.where.not(id: [current_user.id, current_user.friends.pluck(:id)])
  end

  def show
    @user = User.find(params[:id])
  end

  protected

  def user_params
    params.require(:user).permit(:firstname, :username, :lastname, :avatar, :email, :password, :confirmation_password)
  end
end
