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
      flash[:notice] = "Checking site: #{@site.uri}"
      redirect_to ping_path
    else
      render 'new'
    end
  end

  def ping
    @site = Site.find_by_temp_id(cookies[:ticket])

    begin # check header response
      @site.delay.ping
      #@site.save

      flash[:success] = "Found your site! #{@site.uri} (#{@site.code})"
    rescue => e
      flash[:error] = "errors: #{e}"
    end

    redirect_to mysite_path
  end

  def mail

  end
end
