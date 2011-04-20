class SitesController < ApplicationController
  def index
  end

  def new
    @title = "Watch Site"
    @site = Site.new
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
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
