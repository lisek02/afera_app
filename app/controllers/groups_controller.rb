class GroupsController < ApplicationController
  before_action :admin_user, only: :destroy

  def index
  	@groups = Group.all
  end

  def show
  	@group = Group.find(params[:id])
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

  private

  	def group_params
  		params.require(:group).permit(:name, :description)
  	end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end