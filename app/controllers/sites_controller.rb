class SitesController < ApplicationController
  def index
    @site = Site.find_by_temp_id(cookies[:ticket])
  end

  def new
    @title = "Watch Site"
    @site = Site.new
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      cookies.permanent[:ticket] = @site.temp_id
      render 'ping'
    else
      render 'new'
    end
  end

  def ping
    
  end

  def mail

  end
end
