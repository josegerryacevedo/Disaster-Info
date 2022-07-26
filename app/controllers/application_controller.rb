class ApplicationController < ActionController::Base
  def not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  before_action :set_locale

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
