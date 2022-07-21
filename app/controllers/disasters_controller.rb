class DisastersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_disaster, only: :show
  before_action :set_own_disaster, only: [:edit, :update, :destroy]

  def index
    @disasters = Disaster.all.includes(:user)
    @domain = request.base_url
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(disaster_params)
    @disaster.user = current_user
    if @disaster.save
      redirect_to disasters_path, notice: 'Post was successfully submitted'
    else
      render :new
    end
  end

  def edit; end

  def update

    if @disaster.update(disaster_params)
      redirect_to disasters_path
    else
      render :edit
    end
  end

  def show; end

  def set_own_disaster
    @disaster = current_user.disasters.find_by_id(params[:id])
    if @disaster.nil?
      flash[:alert] = 'This post not belongs to you'
      redirect_to disasters_path
    end
  end

  def destroy
    if @disaster.destroy
      redirect_to disasters_path
    end
  end

  def redirect
    @short_ext = params[:disaster_params]
    @disaster = Disaster.find_by(disaster_params: @short_ext)
    if @url.nil?
      not_found
    else
      redirect_to disasters_path
    end
  end

  private

  def disaster_params
    params.require(:disaster).permit(:title, :content, :address, :image, :type_id, :short_url)
  end

  def set_disaster
    @disaster = Disaster.find(params[:id])
  end

end
