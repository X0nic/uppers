require 'net/http'

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
      uri = URI.parse(@site.uri)
      http = Net::HTTP.new(uri.host, uri.port)

      http.use_ssl = true if uri.scheme == 'https'

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      case response
        when Net::HTTPSuccess then flash[:success] = "Found your site!"
        when Net::HTTPRedirection then flash[:success] = "Told off to go somewhere!"
        else flash[:error] = "Brokens"
      end
    rescue => e
      flash[:error] = "errors: #{e}"
    end


    redirect_to mysite_path
  end

  def mail

  end
end
