class Admin::TypesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_type, only: [:edit, :update, :destroy]

  def index
    @types = Type.all
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to admin_types_path, notice: 'Post was successfully submitted'
    else
      render :new
    end
  end

  def new
    @type = Type.new
  end

  def edit; end

  def update
    if @type.update(type_params)
      redirect_to admin_types_path
    else
      render :edit
    end
  end

  def destroy
    if @type.destroy
      redirect_to admin_types_path
    end
  end

  private

  def check_admin
    unless current_user.admin?
      flash[:notice] = "You do not have permission"
      redirect_to disasters_path
    end
  end

  def type_params
    params.require(:type).permit(:category )
  end

  def set_type
    @type = Type.find(params[:id])
  end
end
