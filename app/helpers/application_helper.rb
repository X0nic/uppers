module ApplicationHelper
  def title
    base_title = "Uppers Web Application"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def show_marketing?
    if @show_marketing.nil?
      @show_marketing = false
    end
    @show_marketing
  end

  def has_site?
    cookies[:ticket].nil? == false
  end
end
