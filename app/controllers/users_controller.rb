class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
