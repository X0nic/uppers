module ApplicationHelper
  def title
    base_title = "Uppers Web Application"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
