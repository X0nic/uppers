class HomeController < ApplicationController
  def index
    @title = "Welcome"
    @show_marketing = true
  end
end
