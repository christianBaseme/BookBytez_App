module ApplicationHelper
  # Returns the full title on a per-page basis.
  def signed_in?
    !current_user.nil?
  end
  def full_title(page_title)
    base_title = "BookBytez"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
