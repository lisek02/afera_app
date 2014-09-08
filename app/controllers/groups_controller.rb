class GroupsController < ApplicationController
  before_action :admin_user, only: [:edit, :destroy, :add, :remove]

  def index
  	@groups = Group.all
  end

  def show
  	@group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to @group
    else
      render 'edit'
    end
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(group_params)
  	if @group.save
  		flash[:success] = "New group created!"
  		redirect_to @group
  	else
  		render 'new'
  	end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group destroyed"
    redirect_to groups_path
  end

  #add group to user
  def add
    user = User.find(params[:user_id])
    group = Group.find(params[:group_id])
    user.groups << group
    redirect_to user
  end

  #remove group from user
  def remove
    user = User.find(params[:user_id])
    group = Group.find(params[:group_id])
    user.groups.delete(group)
    redirect_to user
  end

  private

  	def group_params
  		params.require(:group).permit(:name, :description)
  	end
end
