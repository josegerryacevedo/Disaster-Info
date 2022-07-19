class Admin::DisasterTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @disaster_types = DisasterType.all
  end



  def check_admin
    unless current_user.admin?
      flash[:notice] = "You do not have permission"
      redirect_to disaster_types_path
    end
  end
end
