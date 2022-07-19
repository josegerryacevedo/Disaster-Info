class Admin::TypesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @types = Type.all
  end

  def check_admin
    unless current_user.admin?
      flash[:notice] = "You do not have permission"
      redirect_to disasters_path
    end
  end
end
