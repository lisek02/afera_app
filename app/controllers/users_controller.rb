class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index]

  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def show
    @groups = Group.all
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Radio Afera website!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def add_group
    user = User.find(params[:id])
    group = Group.find(params[:group_id])
    user.groups << group
    redirect_to user
  end

  def remove_group
    user = User.find(params[:id])
    group = Group.find(params[:group_id])
    user.groups.delete(group)
    redirect_to user
  end

  private

  	def user_params
  		params.require(:user).permit(:login, :email, :password, :password_confirmation)
  	end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end
end
