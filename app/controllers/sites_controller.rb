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
      flash[:success] = "Your site is being watched by Uppers"
      redirect_to root_path
    else
      render 'new'
    end
  end
end
